from django.contrib import messages
from django.forms import modelform_factory
from django.shortcuts import render, HttpResponse, redirect
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, View, UpdateView
from miembros.forms import *
from miembros.models import *
from django import forms
# Create your views here.
def AddRol(request, id):
    if request.method == 'POST':
        FormularioProyecto = CrearRol(request.POST)
        nuevorol= FormularioProyecto.save(commit=False)
        nuevorol.project = Proyecto.objects.get(id=id)
        nuevorol.save()
        FormularioProyecto.save_m2m()
        return redirect('inicio')  # Este tiene que redirigir a proyecto
    else:
        FormularioProyecto = CrearRol(request.POST)
        return render(request, 'crearRolProyecto.html', {'formaProyecto': FormularioProyecto})

       # model = Miembro
       # form_class = CrearRol
        #template_name = 'crearRolProyecto.html'# Le tengo que agregar miembros/crearProyecto?
       # success_url = reverse_lazy('inicio')

def addMiembro(request, id):
    if request.method == 'POST':
        FormularioProyecto = CrearMiembro(request.POST)
        nuevorol = FormularioProyecto.save(commit=False)
        nuevorol.save()
        return redirect('inicio')  # Este tiene que redirigir a proyecto
    else:
        FormularioProyecto = CrearMiembro(request.GET)
        FormularioProyecto.fields["rol"].queryset =RolProyecto.objects.filter(project_id=id)
        print( RolProyecto.objects.filter(project_id=id))
        return render(request, 'addMiembro.html', {'miembro': FormularioProyecto})

def verMiembro(request, id):
    ver= Miembro.objects.filter(rol__project_id= id,activo=True)
    print(ver)
    return render(request, 'verMiembros.html', {'ver': ver})

def verRolesProyecto(request, id):
    #recoge los roles cuyos id de la clase foranea project coinciden con el id del proyecto
    roles = RolProyecto.objects.filter(project_id=id)
    miembros = Miembro.objects.filter(rol__project_id=id)
    return render(request, 'listarRolesProyecto.html', {'Proyecto': roles, 'Miembros': miembros})

def confirmaDelete(request, id):
    if request.method == 'POST':
        borrar= Miembro.objects.get(id=id)
        idProject= borrar.rol.project.id
        borrar.activo=False
        borrar.save()
        return redirect('verotravesmiembro', id=idProject)
    else:
        return render(request, 'eliminarMiembro.html')

def borrarMiembro(request):
    if request.method == 'POST':
        FormularioProyecto = deleteMiembro(request.POST)
        print(FormularioProyecto)
        form= FormularioProyecto.fields
        return redirect('verotravesmiembro')  # Este tiene que redirigir a proyecto
    else:
        return render(request, 'eliminarMiembro.html')

def modiProject(request, id):
    idprojec = Proyecto.objects.get(id=id)
    auxi= idprojec.creator
    if request.method == 'POST':
        FormularioProyecto = modificarProject(request.POST)
        if FormularioProyecto.is_valid():
            Pr = FormularioProyecto.save(commit=False)
            Pr.creator= auxi
            idprojec.name= Pr.name
            idprojec.fecha_inicio= Pr.fecha_inicio
            idprojec.fecha_fin = Pr.fecha_fin
            try:
                idprojec.save()
            except ValueError as err:
                print(err.args.__str__())
                error = err.args.__str__()
                messages.error(request, error)
                return redirect('modificar', id=id)
            return redirect('inicio')
        return redirect('modificar', id=id)
    if request.method == 'GET':
        idprojec = Proyecto.objects.get(id=id)
        FormularioProyecto = modificarProject(instance = idprojec)
        return render(request, 'modificarProyecto.html', {'proyecto': FormularioProyecto})

def detalleproyecto(request, id):
    idprojec = Proyecto.objects.get(id=id)
    FormularioProyecto =detalleprojecto(instance = idprojec)
    return render(request, 'detalleProyecto.html', {'detalle': idprojec})

class modificarRolProyecto(UpdateView):
    model = RolProyecto
    form_class = editarRolForm
    template_name = 'modificarRolProyecto.html'
    success_url = reverse_lazy('inicio')
    url_redirect = success_url

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Modificar Rol'
        context['entity'] = 'RolProyecto'
        context['list_url'] = self.success_url
        context['action'] = 'edit'
        return context
