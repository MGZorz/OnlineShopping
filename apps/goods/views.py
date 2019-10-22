import math

import jsonpickle
from django.core.cache import cache
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render, redirect

# Create your views here.
from django.views import View
from django_redis import get_redis_connection

from apps.goods.models import *
from apps.order.models import OrderGoods


class IndexView(View):
    def get(self, request):
        # 首先设置缓存，如果有就set进，若没有就get
        context = cache.get('index_page_data')
        if context is None:
            # 展示首页的信息
            # 展示分类
            types = GoodsType.objects.all()
            # 首页轮播图
            goods_banners = IndexGoodsBanner.objects.all().order_by('index')
            # 首页促销
            promotion_banners = IndexPromotionBanner.objects.all().order_by('index')

            for type in types:
                # 图片产品
                image_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=1)
                # 文字产品
                title_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=0)
                # 动态添加文字商品与图片商品
                type.image_banners = image_banners
                type.title_banners = title_banners
            # 组织上下文
            context = {
                'types': types,
                'goods_banners': goods_banners,
                'promotion_banners': promotion_banners
            }
            # 设置缓存
            cache.set('index_page_data', context, 3600)
        # 获取购物车的数量
        cart_count = 0
        # 如果session中有user，那么就显示购物车
        if 'user' in request.session:
            #  通过jsonpickle.loads 获取session中的user的信息，并且转化为json文件
            user = jsonpickle.loads(request.session.get('user'))
            # 链接redis数据库
            connect = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id  # 设置数据格式
            cart_count = connect.hlen(cart_key)  # 返回哈希表中cart_key的个数
        # 更新上下文
        context.update(cart_count=cart_count)
        return render(request, 'goods_index.html', context)
        # 获取session中的user
        # user = request.session.get('user')
        # user = jsonpickle.loads(user)
        # print(user)
        # return render(request, 'goods_index.html', {'user': user})


class DetailView(View):
    def get(self, request):
        # 获取商品的id
        goods_id = request.GET.get('goods_id', '')
        # print(goods_id)
        # 查询商品信息
        try:
            sku = GoodsSKU.objects.get(id=goods_id)
        except:
            return redirect('/index/')
        # 获取商品分类信息
        types = GoodsType.objects.all()
        # 获取商品评论信息
        sku_order = OrderGoods.objects.filter(sku=sku).exclude(comment='')

        # 获取新品信息
        new_skus = GoodsSKU.objects.filter(type=sku.type).exclude(id=sku.id).order_by('-create_time')[:2]
        # 获取购物车中的数目
        cart_count = 0
        # 用户是否已经登录
        if 'user' in request.session:
            user = jsonpickle.loads(request.session.get('user', ''))  # 获取session中的user
            connect = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            cart_count = connect.hlen(cart_key)
            # 添加用户的历史浏览记录
            con = get_redis_connection('default')
            history_key = 'history_%d' % user.id
            # 移除列表中的goods_idk重复元素
            con.lrem(history_key, 0, goods_id)  # lrem 移除列表中与参数VALUE相等的元素
            # 把goods_id插入到列表的左侧
            con.lpush(history_key, goods_id)  # lpush 将一个或多个值插入到列表头部
            # 只保存用户最新浏览的5条信息
            con.ltrim(history_key, 0, 4)  # ltrim 对一个列表进行修剪 start end
        # 组织上下文，传递给页面
        context = {'sku': sku, 'types': types, 'sku_order': sku_order, 'new_skus': new_skus, 'cart_count': cart_count}
        return render(request, 'goods_details.html', context)


class ListView(View):
    def get(self, request, type_id):
        # 获取种类信息
        try:
            type = GoodsType.objects.get(id=type_id)
        except:
            return redirect('/index/')

        # 获取商品的分类信息
        types = GoodsType.objects.all()

        # 获取排序的方式 获取分类的商品信息
        # sort=default 按照默认的id排序
        # sort=price 按照商品价格排序
        # sort=hot 按照商品的销量排序
        sort = request.GET.get('sort', '')
        if sort == 'price':
            skus = GoodsSKU.objects.filter(type=type).order_by('price')
        elif sort == 'hot':
            skus = GoodsSKU.objects.filter(type=type).order_by('-sales')
        else:
            sort = 'default'
            skus = GoodsSKU.objects.filter(type=type).order_by('-id')

        # 获取新品信息
        new_skus = GoodsSKU.objects.filter(type=type).order_by('-create_time')[:2]

        # 获取用户购物车中的商品数目
        # 判断用户登录
        cart_count = 0
        user = ''
        if 'user' in request.session:
            user = jsonpickle.loads(request.session.get('user', ''))
            connect = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            cart_count = connect.hlen(cart_key)

        # 分页器
        page_skus = Paginator(skus, 2)
        num = request.GET.get('num', 1)
        num = int(num)

        try:
            page_list = page_skus.page(num)
        except PageNotAnInteger:
            page_list = page_skus.page(1)
        except EmptyPage:
            page_list = page_skus.page(page_skus.num_pages)

        begin = (num - int(math.ceil(4.0 / 2)))
        if begin < 1:
            begin = 1
        end = begin + 3
        if end > page_skus.num_pages:
            end = page_skus.num_pages

        if end <= 4:
            begin = 1
        else:
            begin = end - 3
        page_num = range(begin, end + 1)

        # 组织上下文
        context = {
            'type': type,
            'types': types,
            'sort': sort,
            'new_skus': new_skus,
            'skus': skus,
            'page_num': page_num,
            'num': num,
            'cart_count': cart_count
        }
        return render(request,'goods_list.html',context)
