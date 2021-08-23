from django.shortcuts import render,  HttpResponse


# Create your views here.
def inico(request):
    return render(request,"principalApp/inicio.html")

def base(request):
    return render(request,"principalApp/base.html")
