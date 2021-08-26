from django.contrib.auth.models import User
from django.shortcuts import render,  HttpResponse
# Create your views here.
from usuario.models import Usuario


def verUsuario(request, id):
    data = {
        'name': Usuario.objects.get(id=id),
        #'Categoria': Proyecto.objects.all()
    }
    return render(request, "verUsuarios.html", data)

def inicio(request):
    return render(request, "inicio.html")