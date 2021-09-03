from django.shortcuts import render, HttpResponse,redirect
from django.contrib.auth import logout, authenticate
from django.urls import reverse_lazy
# from Proyecto_local_new.principalApp.views import inicio
from .forms import PostLoginForm
from django.views.generic import ListView, CreateView

# Create your views here.
def loginView(request):
    if request.user.is_authenticated:
        return redirect('principalApp/inicio')
    return render(request,"login.html")
from usuario.models import Usuario


def login(request):
    return render(request, "login.html")

def pantalla(request):
    return render(request, "pantalla.html")

def login_super_usuario(request):
    # en caso de estar completado guardaremos el contenido del formulario
    if request.method == 'POST':
        form = PostLoginForm(request.POST)
        if form.is_valid():
            form.save()
        return redirect('inicio')
    else:
        form = PostLoginForm()

    return render(request, 'templates/login_super_user.html', {'form': form})



