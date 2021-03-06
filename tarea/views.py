import datetime

from django.shortcuts import render, redirect

# Create your views here.
from project.models import Proyecto
from sprint.models import Sprint
from tarea.forms import *
from tarea.models import HistorialTarea
from us.models import Us
from miembros.models import *


def crear_tarea(request, pk,sp_pk, us_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    if request.method == 'POST':
        formularioTarea = crearTarea(request.POST)
        new_tarea = formularioTarea.save(commit=False)
        new_tarea.ustory = Us.objects.get(id=us_pk)
        new_tarea.sprimt = Sprint.objects.get(pk=sp_pk)
        if new_tarea.fecha_creacion is None:
            new_tarea.fecha_creacion = datetime.datetime.now()
        new_tarea.save()
        return redirect('tareas_sprimt', pk=pk, sp_pk=sp_pk, us_pk=us_pk)
    else:
        formularioTarea = crearTarea(request.GET)
        return render(request, 'crear_tarea.html', {'form': formularioTarea, 'Proyecto': Proyecto.objects.get(pk=pk),'Sprimt':Sprint.objects.get(id=sp_pk), 'Us': Us.objects.get(pk= us_pk), 'permisos': permisos})

def editar_tarea(request, pk,sp_pk, us_pk, tr_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    if request.method == 'POST':
        FormularioUserStory = editarTarea(request.POST)
        nuevous = FormularioUserStory.save(commit=False)
        nuevous.ustory = Us.objects.get(id=us_pk)
        anteriotarea= Tarea.objects.get(id= tr_pk)
        anteriotarea.descripcion= nuevous.descripcion
        anteriotarea.horas= nuevous.horas
        anteriotarea.save()
        return redirect('tareas_sprimt', pk=pk, sp_pk=sp_pk, us_pk=us_pk)
    else:
        FormularioUserStory = crearTarea(instance= Tarea.objects.get(id= tr_pk))
        return render(request, 'editar_tarea.html',
                      {'form': FormularioUserStory, 'Proyecto': Proyecto.objects.get(pk=pk),
                       'Sprimt': Sprint.objects.get(id=sp_pk),
                       'Us': Us.objects.get(pk=us_pk), 'permisos': permisos})

def tareas(request, pk, us_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    tr=Tarea.objects.filter(ustory__id=us_pk) #Filtar los us por proyecto
    proj=Proyecto.objects.get(id=pk)
    us= Us.objects.get(id=us_pk)
    m = Miembro.objects.get(user=request.user, rol__project_id= pk)
    is_scrum = str(m.rol) == 'Scrum Master'


    context={
        'Us':us,
        'User':user,
        'Proyecto':proj,
        'Tr': tr,
        'permisos': permisos,
        'is_scrum': is_scrum
    }
    return render(request,'tareas.html',context=context)
def historial_tarea(request, pk, us_pk, tr_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')

    historial= HistorialTarea.objects.filter(tarea_id= tr_pk)
    return render(request, 'historial_tarea.html', {'histo': historial, 'u': Us.objects.get(pk=us_pk), 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos})


def borrar_tarea(request, pk,sp_pk, us_pk, tr_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    if request.method == 'POST':
        nuevous = Tarea.objects.get(id=tr_pk).delete()
        return redirect('tareas_sprimt', pk=pk, sp_pk=sp_pk, us_pk=us_pk)
    else:
        return render(request, 'borrar_tarea.html', {'Proyecto': Proyecto.objects.get(pk= pk),
                                                     'Sprimt': Sprint.objects.get(id=sp_pk),
                                                    'Us': Us.objects.get(pk= us_pk), 'permisos': permisos})

def tareas_sprimt(request, pk,sp_pk, us_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    tr=Tarea.objects.filter(ustory__id=us_pk, sprimt_id__gte=sp_pk) #Filtar los us por proyecto
    proj=Proyecto.objects.get(id=pk)
    us= Us.objects.get(id=us_pk)
    m = Miembro.objects.get(user=request.user, rol__project_id= pk)
    is_scrum = str(m.rol) == 'Scrum Master'


    context={
        'Us':us,
        'User':user,
        'Proyecto':proj,
        'Tr': tr,
        'permisos': permisos,
        'is_scrum': is_scrum,
        'sprimt': Sprint.objects.get(id=sp_pk)
    }
    return render(request,'tareas_sprimt.html',context=context)

def historial_tarea_sprimt(request, pk,sp_pk, us_pk, tr_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')

    historial= HistorialTarea.objects.filter(tarea_id= tr_pk)
    return render(request, 'historial_tarea_sprimt.html', {'histo': historial, 'u': Us.objects.get(pk=us_pk),'Sprimt': Sprint.objects.get(id=sp_pk), 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos})
