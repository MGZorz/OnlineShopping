from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.LoginView.as_view()),  # 登录
    path('logout/', views.LogoutView.as_view()),  # 退出登录
    path('register/', views.RegisterView.as_view()),  # 注册
    path('code_uname/', views.CodeUnameView.as_view()),  # 检验用户名
    path('code_email/', views.CodeEmailView.as_view()),  # 检验邮箱
    path('active/<token_id>', views.ActiveView.as_view()),  # 激活账户
    path('', views.UserInfoView.as_view()),  # 用户个人信息
    path('order/<num>', views.OrderView.as_view()),  # 用户订单路由
    path('address/', views.AddressView.as_view()),  # 用户地址路由

]
