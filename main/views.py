from socketIO_client_nexus import SocketIO, LoggingNamespace
from django.shortcuts import render
from django.http import JsonResponse
from .models import Process

# Create your views here.


def index(request):
    return render(request, 'main/index.jade')


def start_process(request):
    with open('./socket-port') as f:
        socket_port = int(f.readline())
    p = Process.objects.create()
    with SocketIO('localhost', socket_port, LoggingNamespace) as socketIO:
        socketIO.emit('start_process', {'pid': p.pid})
    return JsonResponse({'pid': p.pid})
