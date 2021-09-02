from django.forms import modelform_factory
from django.shortcuts import render, HttpResponse, redirect
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView

from miembros.forms import CrearRol, CrearMiembro, deleteMiembro
from miembros.models import *
# Create your views here.
def AddRol(request):
    if request.method == 'POST':
        FormularioProyecto = CrearRol(request.POST)
        nuevorol= FormularioProyecto.save(commit=False)
        nuevorol.save()
        FormularioProyecto.save_m2m()
        return redirect('inicio')  # Este tiene que redirigir a proyecto
    else:
        FormularioProyecto = CrearRol(request.POST)
        return render(request, 'crearProyecto.html', {'formaProyecto': FormularioProyecto})

       # model = Miembro
       # form_class = CrearRol
        #template_name = 'crearProyecto.html'# Le tengo que agregar miembros/crearProyecto?
       # success_url = reverse_lazy('inicio')

def addMiembro(request):
    if request.method == 'POST':
        FormularioProyecto = CrearMiembro(request.POST)
        nuevorol = FormularioProyecto.save(commit=False)
        nuevorol.save()
        return redirect('inicio')  # Este tiene que redirigir a proyecto
    else:
        FormularioProyecto = CrearMiembro(request.POST)
        return render(request, 'addMiembro.html', {'miembro': FormularioProyecto})

def verMiembro(request, id):
    ver= Miembro.objects.filter(rol__project_id= id,activo=True)
    print(ver)
    return render(request, 'verMiembros.html', {'ver': ver})
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


#formaProyecto = CrearRol()
"""def nuevoRolProyecto(request, id):
    if request.method == 'POST':
        FormularioProyecto = formaProyecto(request.POST)
        Modelo = FormularioProyecto.save(commit=False) #guardar
        Modelo.project = Proyecto.objects.get(id=id) #obtener el usuario dado su id
        Modelo.save()
        return redirect('inicio')# Este tiene que redirigir a proyecto
    else:
        return render(request, 'crearProyecto.html', {'formaProyecto': formaProyecto, 'id': id})"""
