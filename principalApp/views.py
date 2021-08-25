from django.shortcuts import render,  HttpResponse


# Create your views here.
def inicio(request):
    return render(request, "inicio.html")

def base(request):
    return render(request, "base.html")
