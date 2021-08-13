from django.shortcuts import render, HttpResponse


# Create your views here.
def home(request):
    return render(request,"loginSSO/login.html")

def pantalla(request):
    return render(request,"loginSSO/pantalla.html")