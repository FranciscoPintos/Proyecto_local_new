from django.contrib.auth.models import User
from django.shortcuts import render,  HttpResponse
# Create your views here.
from usuario.models import Usuario


def verUsuario(request):
    data = {
        'name': Usuario.objects.all(),
        #'Categoria': Proyecto.objects.all()
    }
    return render(request, "verUsuarios.html", data)
