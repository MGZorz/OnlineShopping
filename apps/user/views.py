import math
import re

import jsonpickle
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from django_redis import get_redis_connection
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer, SignatureExpired
from django.core.mail import send_mail
# Create your views here.
from django.views import View

from OnlineShopping.settings import SECRET_KEY, EMAIL_FROM
from apps.goods.models import GoodsSKU
from apps.order.models import OrderInfo, OrderGoods
from apps.user.models import *


class LoginView(View):
    def get(self, request):
        if 'username' in request.COOKIES and 'password' in request.COOKIES:
            username = request.COOKIES.get('username')
            password = request.COOKIES.get('password')
            checked = 'checked'
            # print(username, password)
        else:
            username = ''
            password = ''
            checked = ''
        return render(request, 'login.html', {'username': username, 'password': password, 'checked': checked})

    def post(self, request):
        username = request.POST.get('username', '')
        password = request.POST.get('password')
        remember = request.POST.get('remember')

        try:
            user = User.objects.get(username=username, password=password)
        except:
            return redirect('/user/login/')
        # 确定激活状态
        if user.is_active == False:
            return render(request, 'login.html', {'errmsg': '账户未激活'})
        # 存储session
        request.session['user'] = jsonpickle.dumps(user)
        res = redirect('/index/')
        if remember == 'on':
            res.set_cookie('username', username, max_age=700)
            res.set_cookie('password', password, max_age=700)
        else:
            res.delete_cookie('username')
            res.delete_cookie('password')
        return res


class RegisterView(View):
    def get(self, request):
        return render(request, 'register.html')

    def post(self, request):
        uname = request.POST.get('user_name', '')
        pwd = request.POST.get('pwd')
        email = request.POST.get('email')

        # 校验数据
        if not all([uname, pwd, email]):
            return render(request, 'register.html', {'errmsg': '数据不完整'})
        try:
            user = User.objects.create(username=uname, password=pwd, email=email)
        except:
            return redirect('/user/register/')

        # 激活邮件，激活连接中需要包含用户的身份信息,并且要把身份信息进程加密处理

        serializer = Serializer(SECRET_KEY, 3600)
        info = {'user_id': user.id}
        token = serializer.dumps(info)
        token = token.decode('utf-8')

        subject = '欢迎光临小店'
        message = ''
        send = EMAIL_FROM
        receiver = [email]
        html_message = '<h1>%s,欢迎登陆小店</h1>请点击以下链接进行账户激活</h><a href = "http://127.0.0.1:8000/user/active/%s">http://127.0.0.1:8000/user/active/%s</a>' % (
            uname, token, token)
        send_mail(subject, message, send, receiver, html_message=html_message)
        return redirect('/user/login/')


class CodeUnameView(View):
    ''' 用户名检验 '''

    def get(self, request):
        username = request.GET.get('username')
        user = User.objects.filter(username=username)
        flag = False
        password = ''
        if user:
            flag = True
            for u in user:
                password = u.password
        return JsonResponse({'flag': flag, 'password': password})


class CodeEmailView(View):
    def get(self, request):
        email = request.GET.get('email')
        user = User.objects.filter(email=email)
        flag = False
        if user:
            flag = True
        return JsonResponse({'flag': flag})


class ActiveView(View):
    def get(self, request, token_id):
        serializer = Serializer(SECRET_KEY, 3600)  # 定义加密器
        try:
            info = serializer.loads(token_id)  # 解加密
            user_id = info['user_id']
            user = User.objects.get(id=user_id)
            user.is_active = 1
            user.save()
            return redirect('/user/login/')
        except:
            return HttpResponse('激活链接已过期')


class UserInfoView(View):
    def get(self, request):

        if 'user' not in request.session:
            return redirect('/user/login/')
        # 获取个人信息
        # 获取用户默认地址
        user = jsonpickle.loads(request.session.get('user', ''))
        try:
            address = Address.objects.get(user=user, is_default=True)
        except:
            address = None

        '''历史记录'''
        # 链接Redis数据库
        connect = get_redis_connection('default')  # 链接Redis数据库
        history_key = 'history_%d' % user.id  # 设置数据格式

        # 获取用户最新浏览的5个商品 id
        # lrange 从左边取值 从下标0开始拿到4 ,共计5个
        # 返回列表
        skus_id = connect.lrange(history_key, 0, 4)
        # 从数据库中查询用户浏览的商品的具体信息
        goods_list = []
        for id in skus_id:
            goods = GoodsSKU.objects.get(id=id)
            goods_list.append(goods)
        # 上下文
        context = {
            'page': 'user',
            'address': address,
            'goods_list': goods_list,
        }
        return render(request, 'user_info.html', context)


class LogoutView(View):
    def get(self, request):
        # 删除session
        # del request.session['user']
        request.session.flush()
        return redirect('/user/login/')


class OrderView(View):
    def get(self, request, num):
        '''用户中心-全部订单'''
        if 'user' not in request.session:
            return redirect('/user/login/')
        user = jsonpickle.loads(request.session.get('user'))
        # 所有订单
        orders = OrderInfo.objects.filter(user=user).order_by('-create_time')
        # 遍历订单
        for order in orders:
            # 所有订单商品
            order_skus = OrderGoods.objects.filter(order=order)
            # 遍历订单商品
            for order_sku in order_skus:
                amount = order_sku.price * order_sku.count
                order_sku.amount = amount
            order.order_skus = order_skus
            order.status_name = OrderInfo.ORDER_STATUS[order.order_status]

            # 分页
            page_orders = Paginator(orders, 1)
            num = int(num)

            try:
                page_list = page_orders.page(num)
            except PageNotAnInteger:
                page_list = page_orders.page(1)
            except EmptyPage:
                page_list = page_orders.page(page_orders.num_pages)
            # print(page_list)

            begin = (num - int(math.ceil(4.0 / 2)))
            if begin < 1:
                begin = 1

            end = begin + 3
            if end > page_orders.num_pages:
                end = page_orders.num_pages
            if end <= 4:
                begin = 1
            else:
                begin = end - 3
            page_num = range(begin, end + 1)

        context = {
            'page': 'order',
            'orders': page_list,
            'num': num,
            'page_num': page_num,
        }
        # print(context)
        return render(request, 'user_order.html', context)


class AddressView(View):
    def get(self, request):
        if 'user' not in request.session:
            return redirect('/user/login/')
        # 获取用户默认收货地址
        user = jsonpickle.loads(request.session.get('user', ''))
        try:
            address = Address.objects.get(user=user, is_default=True)
        except:
            # 不存在默认的收货地址
            address = None

        return render(request, 'user_address.html', {'page': 'address', 'address': address})

    def post(self, request):
        # 接受数据
        receiver = request.POST.get('receiver')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        addr = request.POST.get('addr')
        # 校验数据
        if not all([receiver, phone, email, addr]):
            print('数据不完整')
            return render(request, 'user_address.html', {'errmsg': '数据不完整'})

        if not re.match(r'^1[3|4|5|7|8][0-9]{9}$', phone):
            print('手机号错误')
            return render(request, 'user_address.html', {'errmsg': '手机号错误'})
        user = ''
        if 'user' in request.session:
            user = jsonpickle.loads(request.session.get('user'))

        # 判断is_default值
        try:
            address = Address.objects.get(user=user, is_default=True)
        except Address.DoesNotExist:
            address = None
        # print(address)
        if address:
            is_default = False
        else:
            is_default = True

        try:
            Address.objects.create(receiver=receiver, phone=phone, zip_code=email, addr=addr, user=user,
                                   is_default=is_default)
        except Address.DoesNotExist:
            return render(request, 'user_address.html', {'errmsg': '添加失败'})
        # print('走过来了')
        return redirect('/user/address/')
