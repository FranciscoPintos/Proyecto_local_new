from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib.auth.models import Group
from django.http import JsonResponse, HttpResponseRedirect
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.shortcuts import render, HttpResponse,get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

from roles.mixins import *

from usuario.models import Usuario
from us.models import *
from us.forms import *
from project.models import Proyecto


# Create your views here.

@login_required(login_url='login')
def us(request,pk):
    # us=Us.objects.filter(project=pk) #Filtar los us por proyecto
    us = Us.objects.all() # Todos los us creados
    proj=Proyecto.objects.get(id=pk)
    user=request.user
    context={
        'Us':us,
        'User':user,
        'Proj':proj
    }
    print (context)
    return render(request,'us.html',context=context)

def view_us(request,pk,us_pk):
    us=Us.objects.get(id=us_pk)
    proj = Proyecto.objects.get(id=pk)
    context={
        'Us':us,
        'Proj':proj
    }
    return render(request,'detalle_us.html',context)


class crear_us(LoginRequiredMixin,ValidatePermissionRequiredMixin, CreateView):
    permission_required = 'add_Us'
    model = Us
    form_class = crearUsForm
    template_name = 'create_us.html'

    def get_success_url(self):
        print('entro aca?')
        proj_id= self.kwargs['pk']
        return reverse_lazy('us', kwargs={'pk': proj_id})
    def get_initial(self):
        initial = super(crear_us, self).get_initial()
        initial['project'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        initial['estado']=Us.status[0]
        print('inicial:', initial)
        return initial
    def get_context_data(self, **kwargs):
        context = super(crear_us, self).get_context_data(**kwargs)
        context['proj'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        return context
    def post(self, request, *args, **kwargs):
        self.object=self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
            data=form.save(commit=False)
            print('dfgdfgd',data.project)
            data.project=Proyecto.objects.get(pk=self.kwargs['pk'])
            data.estado=Us.status[0][0]
            data.save()
            return HttpResponseRedirect(self.get_success_url())
        return self.render_to_response(self.get_context_data(form=form))





class Us_Delete(LoginRequiredMixin,ValidatePermissionRequiredMixin, DeleteView):
    permission_required ='delete_Us'
    model = Us
    template_name = 'delete_us.html'
    pk_sched_kwargs = 'us_pk'  # Definir el nombre del parametro obtenido en la url

    def get_object(self, queryset=None):
        id = int(self.kwargs.get(self.pk_sched_kwargs, None))
        obj = get_object_or_404(Us, pk=id)
        return obj

    def get_success_url(self):
        proj_id = self.kwargs['pk']
        return reverse_lazy('us', kwargs={'pk': proj_id})
    def get_context_data(self, **kwargs):
        context = super(Us_Delete, self).get_context_data(**kwargs)
        context['proj'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        print(context)
        return context

class editUs(LoginRequiredMixin,ValidatePermissionRequiredMixin,UpdateView):
    permission_required = 'change_Us'
    model = Us
    form_class = editUsForm
    template_name = 'editar_us.html'
    pk_sched_kwargs = 'us_pk' #Definir el nombre del parametro obtenido en la url

    def get_object(self, queryset=None):
        id = int(self.kwargs.get(self.pk_sched_kwargs, None))
        obj = get_object_or_404(Us, pk=id)
        return obj

    def get_success_url(self):
        proj_id= self.kwargs['pk']
        return reverse_lazy('us', kwargs={'pk': proj_id})

    def get_context_data(self, **kwargs):
        context = super(editUs, self).get_context_data(**kwargs)
        context['proj'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        return context