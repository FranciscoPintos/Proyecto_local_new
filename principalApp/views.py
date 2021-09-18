from django.shortcuts import render, HttpResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView


# Create your views here.
class inicioview(TemplateView):
    template_name = 'inicio.html'


class baseview(TemplateView):
    template_name = 'base.html'

class calendar(TemplateView):
        template_name = 'calendar.html'


# def inico(request):
#     return render(request,"principalApp/inicio.html")
#
# def base(request):
#     return render(request,"principalApp/base.html")

def pr(request):
<<<<<<< HEAD
    return render(request,"principalApp/pr.html")

def crearProyecto(request):
    data = {
        'name': 'Ever',
        'Categoria': Proyecto.objects.all()
    }
    return render(request, "crearRolProyecto.html", data)
=======
    return render(request, "principalApp/pr.html")
>>>>>>> Rutas cambiadas
