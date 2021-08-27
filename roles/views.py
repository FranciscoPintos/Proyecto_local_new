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

from roles.mixins import *

from usuario.models import Usuario
from roles.models import Rol
from roles.forms import crearRolForm



def roles(request):
    rol=Rol.objects.all()
    return render(request,'roles.html',{'Rol':rol})

# Create your views here.
class crear_rol(CreateView):
    model = Rol
    form_class = crearRolForm
    template_name = 'create_rol.html'
    success_url = reverse_lazy('creado')
    url_redirect = success_url

    # @method_decorator(csrf_exempt)
    # def dispatch(self, request, *args, **kwargs):
    #     self.object = self.get_object()
    #     return super().dispatch(request, *args, **kwargs)
    # def post(self, request, *args, **kwargs):
    #     data = {}
    #     print('LLamo aca')
    #     try:
    #         if request.POST['action']:
    #             form = self.get_form()
    #             data = form.save()
    #         else:
    #             data['error'] = 'No ha ingresado a ninguna opción'
    #     except Exception as e:
    #         data['error'] = str(e)
    #     return JsonResponse(data)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear Rol'
        context['entity'] = 'Rol'
        context['list_url'] = self.success_url
        context['action'] = 'edit'
        return context
class creado(TemplateView):
    template_name = 'Creado.html'