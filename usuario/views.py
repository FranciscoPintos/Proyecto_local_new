from django.contrib.auth.models import User
from django.shortcuts import render, HttpResponse

from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import Group
from django.http import JsonResponse, HttpResponseRedirect
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, FormView
from django.contrib.auth.decorators import permission_required

from roles.mixins import *

# Create your views here.
from usuario.models import Usuario


def verUsuario(request, id):
    data = {
        'name': Usuario.objects.get(id=id),
        #'Categoria': Proyecto.objects.all()
    }
    return render(request, "verUsuarios.html", data)


# LoginRequiredMixin redirecciona al usuario al login si no está logueado
#@permission_required('usuario.view_usuario', '/inicio/')
class UserListView(LoginRequiredMixin, ListView):
    model = Usuario
    template_name = 'roles.html'
    permission_required = 'usuario.view_usuario'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Usuario.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Roles'
        context['create_url'] = ''  # reverse_lazy('user:user_create')
        context['list_url'] = reverse_lazy('user_list')
        context['entity'] = 'Usuarios'
        return context


# # LoginRequiredMixin redirecciona al usuario al login si no está logueado
# #@permission_required('usuario.view_usuario', '/inicio/')
# class UserListView(LoginRequiredMixin, ListView):
#     model = Usuario
#     template_name = 'roles.html'
#     permission_required = 'usuario.view_usuario'
#
#     @method_decorator(csrf_exempt)
#     def dispatch(self, request, *args, **kwargs):
#         return super().dispatch(request, *args, **kwargs)
#
#     def post(self, request, *args, **kwargs):
#         data = {}
#         try:
#             action = request.POST['action']
#             if action == 'searchdata':
#                 data = []
#                 for i in Usuario.objects.all():
#                     data.append(i.toJSON())
#             else:
#                 data['error'] = 'Ha ocurrido un error'
#         except Exception as e:
#             data['error'] = str(e)
#         return JsonResponse(data, safe=False)
#
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['title'] = 'Roles'
#         context['create_url'] = ''  # reverse_lazy('user:user_create')
#         context['list_url'] = reverse_lazy('user_list')
#         context['entity'] = 'Usuarios'
#         return context

def inicio(request):
    return render(request, "inicio.html")