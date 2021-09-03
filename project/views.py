import sys

from django.contrib import messages
from django.forms import modelform_factory, forms
from django.shortcuts import render, redirect
from django.forms import ModelForm
from django import forms
from django.shortcuts import get_object_or_404

# Create your views here.
from django.views.generic import ListView, CreateView

from project.forms import CreateProyectoForm, ProyectoForm
from project.models import Proyecto
from usuario.models import Usuario


def nuevoProyecto(request, id):
    if  request.method == 'POST':
        #formaProyecto = modelform_factory(Proyecto, exclude=['creator', 'active', 'fecha_inicio', 'fecha_fin'])
        #proyectoForm = formaProyecto(request.POST)
        proyectoForm = ProyectoForm(request.POST)
        if proyectoForm.is_valid():
            Pr = proyectoForm.save(commit=False)
            Pr.creator = Usuario.objects.get(id=id)
            try:
                Pr.save()
            except ValueError as err:
                print (err.args.__str__())
                error = err.args.__str__()
                messages.error(request,error)
                return redirect('crearProyecto',id)

            return redirect('inicio')
        else:
            return render(request, 'nuevoProyecto.html', {'formaProyecto': proyectoForm})

    else:
        #formaProyecto = modelform_factory(Proyecto, exclude=['creator', 'active','fecha_inicio','fecha_fin'])
        formaProyecto = ProyectoForm(request.POST)
        return render(request, 'nuevoProyecto.html', {'formaProyecto': formaProyecto})

class ProyectosView(ListView):
    model = Proyecto
    templat_name = 'project/nuevoProyecto.html'

class ProyectoCreate(CreateView):
    model = Proyecto
    template_name = 'proyecto/crearRolProyecto.html'
    form_class = CreateProyectoForm
    def get_context_data(self, **kwargs):
        context = super(ProyectoCreate, self).get_context_data(**kwargs)
        if 'form' not in context:
            context['form'] = self.form_class(self.request.GET)

        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object
        form = self.form_class(request.POST)
