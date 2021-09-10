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
from us.models import *
from us.forms import *


# Create your views here.

@login_required(login_url='login')
def us(request):
    us=Us.objects.all()
    user=request.user
    context={
        'Us':us,
        'User':user
    }
    return render(request,'us.html',context=context)

def view_us(request,pk):
    us=Us.objects.get(id=pk)
    return render(request,'detalle_us.html', {'Us':us})


class crear_us(LoginRequiredMixin,ValidatePermissionRequiredMixin, CreateView):
    permission_required = 'add_Us'
    model = Us
    form_class = crearUsForm
    template_name = 'create_us.html'
    success_url = reverse_lazy('us')
    url_redirect = success_url

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear User Story'
        context['entity'] = 'Us'
        context['list_url'] = self.success_url
        context['action'] = 'edit'
        return context


class Us_Delete(LoginRequiredMixin,ValidatePermissionRequiredMixin, DeleteView):
    permission_required ='delete_Us'
    model = Us
    template_name = 'delete_us.html'
    success_url = reverse_lazy('us')
    url_redirect = success_url



class editUs(LoginRequiredMixin,ValidatePermissionRequiredMixin,UpdateView):
    permission_required = 'change_Us'
    model = Us
    form_class = editUsForm
    template_name = 'editar_us.html'
    success_url = reverse_lazy('us')
    url_redirect = success_url

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Editar Us'
        context['entity'] = 'Us'
        context['list_url'] = self.success_url
        context['action'] = 'edit'
        return context
# class detalleUs(LoginRequiredMixin,ValidatePermissionRequiredMixin,ListView):
#     permission_required = 'view_Us'
#     model = Us
#     form_class = viewUsForm
#     template_name = 'detalle_us.html'
#     success_url = reverse_lazy('us')
#     url_redirect = success_url
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['title'] = 'Ver Us'
#         context['entity'] = 'Us'
#         context['list_url'] = self.success_url
#         context['action'] = 'edit'
#         return context