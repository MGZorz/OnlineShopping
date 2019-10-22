from django.urls import path
from . import views

urlpatterns = [
    path('index/', views.IndexView.as_view()),  # 首页
    path('detail/', views.DetailView.as_view()),  # 详情页面
    path('list/<type_id>/', views.ListView.as_view())  # 种类列表
]
