from django.shortcuts import render, HttpResponse,redirect
from django.contrib.auth import logout, authenticate
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView



# Create your views here.
def loginView(request):
    if request.user.is_authenticated:
        return redirect('principalApp/inicio')
    return render(request,"login.html")


def pantalla(request):
    return render(request, "pantalla.html")

def login_super_usuario(request):
    if request.user.is_authenticated:
        return redirect('principalApp/inicio')
    return render(request, "login_super_user.html")

