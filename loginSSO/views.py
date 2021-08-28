from django.shortcuts import render, HttpResponse,redirect
from django.contrib.auth import logout, authenticate
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView



# Create your views here.
class loginView(TemplateView):
    template_name='login.html'


def pantalla(request):
    return render(request, "pantalla.html")

def login_super_usuario(request):
    return render(request, "login_super_user.html")

