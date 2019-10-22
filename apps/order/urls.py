from django.urls import path

from . import views

urlpatterns = [
    path('place/', views.OrderPlaceView.as_view()),  # 订单的的地址
    path('commit/', views.CommitView.as_view()),  # 订单添加
    path('pay/', views.PayView.as_view()),  # 订单支付
    path('check/', views.CheckView.as_view()),  # 支付结果检查
    path('comment/<order_id>', views.CommentView.as_view())  # 评论功能
]
