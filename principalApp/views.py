from django.contrib.auth.models import Permission
from django.shortcuts import render, HttpResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.contrib.auth.decorators import login_required


from roles.models import Rol
from project.models import *
from miembros.models import *
# Create your views here.
@login_required(login_url='login')
def inicioview(request):
    us= request.user
    try:
        pk = Miembro.objects.get(user_id=us.id).rol.project.id
        proj = Proyecto.objects.filter(id=pk)
        context = {
            'Proyectos': proj,
        }
        print(context)
        return render(request, 'inicio.html', context=context)
    except Exception as e:
        print(e)
        return render(request, 'inicio.html')


def baseview(request):
    return render(request, 'base.html', context=context)

class calendar(TemplateView):
        template_name = 'calendar.html'

def pr(request):
    return render(request,"principalApp/pr.html")
