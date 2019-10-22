from django.urls import path

from . import views

urlpatterns = [
    path('add/', views.AddView.as_view()),  # 添加商品进入购物车
    path('info/', views.InfoView.as_view()),  # 购物车详情信息
    path('update/', views.UpdateView.as_view()),  # 购物车详情更新（增+改+查）
    path('delete/', views.DeleteView.as_view()), # 购物车详情删除

]
