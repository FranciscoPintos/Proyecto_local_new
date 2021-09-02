from django.shortcuts import render,  HttpResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView

# Create your views here.
class inicioview(TemplateView):
    template_name = 'inicio.html'

class baseview(TemplateView):
    template_name = 'base.html'
# def inico(request):
#     return render(request,"principalApp/inicio.html")
#
# def base(request):
#     return render(request,"principalApp/base.html")

def pr(request):
    return render(request,"principalApp/pr.html")

def crearProyecto(request):
    data = {
        'name': 'Ever',
        'Categoria': Proyecto.objects.all()
    }
    return render(request, "crearProyecto.html", data)
