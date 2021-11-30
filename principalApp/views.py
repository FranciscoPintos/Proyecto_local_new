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
    user = request.user
    perm_proyecto_ver = user.has_perm('view_proyecto')
    perm_roles_ver = user.has_perm('view_rol')
    context = {
        'perm_proyectos_ver': perm_proyecto_ver,
        'perm_roles_ver': perm_roles_ver,
    }
    return render(request, 'inicio.html', context=context)


def baseview(request):
    return render(request, 'base.html', context=context)


class calendar(TemplateView):
    template_name = 'calendar.html'


class email(TemplateView):
    template_name = 'send_email.html'
def pr(request):
    return render(request, "principalApp/pr.html")
