from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib.auth.models import Group
from django.http import JsonResponse, HttpResponseRedirect
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.shortcuts import render, HttpResponse
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

from roles.mixins import *

from usuario.models import Usuario
from roles.models import *
from roles.forms import *


@login_required(login_url='login')
def roles(request):
    rol=Rol.objects.all()
    return render(request,'roles.html',{'Rol':rol})

def base_roles(request):
    return render(request,'base_rol.html')

# Create your views here.


class crear_rol(LoginRequiredMixin,CreateView):
    model = Rol
    form_class = crearRolForm
    template_name = 'create_rol.html'
    success_url = reverse_lazy('roles')
    url_redirect = success_url

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear Rol'
        context['entity'] = 'Rol'
        context['list_url'] = self.success_url
        context['action'] = 'edit'
        return context


class RolDelete(LoginRequiredMixin,DeleteView):
    model = Rol
    template_name = 'delete.html'
    success_url = reverse_lazy('roles')
    #permission_required = 'user.delete_user'
    url_redirect = success_url



class editRol(LoginRequiredMixin,UpdateView):
    model = Rol
    form_class = editRolForm
    template_name = 'editar_rol.html'
    success_url = reverse_lazy('roles')
    url_redirect = success_url

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear Rol'
        context['entity'] = 'Rol'
        context['list_url'] = self.success_url
        context['action'] = 'edit'
        return context



class creado(TemplateView):
    template_name = 'Creado.html'