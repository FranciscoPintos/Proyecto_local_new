from django.shortcuts import render,  HttpResponse


# Create your views here.
def inico(request):
    return render(request,"principalApp/inicio.html")

def base(request):
    return render(request,"principalApp/base.html")

def pr(request):
    return render(request,"principalApp/pr.html")

def crearProyecto(request):
    data = {
        'name': 'Ever',
        'Categoria': Proyecto.objects.all()
    }
    return render(request, "crearProyecto.html", data)
