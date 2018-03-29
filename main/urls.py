from django.conf.urls import url

from . import views

app_name = 'main'
urlpatterns = [
    url(r'^$', views.index),
    url(r'^start_process$', views.index),
]

# vi:et:sw=4:sts=4
