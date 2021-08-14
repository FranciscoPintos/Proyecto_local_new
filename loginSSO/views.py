from django.shortcuts import render, HttpResponse,redirect
from django.contrib.auth import logout, authenticate



# Create your views here.
def login(request):
    return render(request, "login.html")

def pantalla(request):
    return render(request, "pantalla.html")

