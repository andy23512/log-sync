from django.conf.urls import url

from . import views

app_name = 'main'
urlpatterns = [
    url(r'^$', views.index),
    url(r'^start_process$', views.start_process),
    url(r'^processing_processes$', views.processing_processes),
]

# vi:et:sw=4:sts=4
