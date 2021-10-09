from django.shortcuts import render

from equipo.forms import CrearEquipo
from equipo.models import Equipo
from miembros.models import Miembro
from project.models import Proyecto
from sprint.models import Sprint

# Importaciones para fechas
import numpy as np
import datetime

def crearEquipo(request, pk, sp_pk):
    """
    Vista basa en función para la creación de un Equipo que conforma un sprint asignando miembros al equipo
    :param request:
    :param pk:
    :param sp_pk:
    :return:
    """
    # Proyecto al que pertenece
    proyecto = Proyecto.objects.get(id=pk)
    # Sprint para el cual se crea el equipo
    sprint = Sprint.objects.get(id=sp_pk)
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')

    # Obtener todos los miembros válidos para trabajar en un sprint, estos no pueden ser aquellos usuarios que sean product owner, scrum master o usuarios sin roles de proyecto
    miembros = Miembro.objects.filter(rol__project_id=pk, activo=True).exclude(rol__name='Scrum Master').exclude(rol__name='Product Owner').exclude(rol__name='')

    # Si ya existe un Equipo asociado al Sprint
    if Equipo.objects.filter(sprint_id=sp_pk):
        # Obtener el equipo de trabajo
        equipo = Equipo.objects.get(sprint_id=sp_pk)
        # Crear un formulario para el equipo existente
        formEquipo = CrearEquipo(instance=equipo)
    else:
        # Crear un formulario vacío
        formEquipo = CrearEquipo()
    # Asignar lista de miembros seleccionables
    formEquipo.fields['miembros'].queryset = miembros
    # Si ya existe un equipo
    if Equipo.objects.filter(sprint_id=sp_pk):
        # Obtener el equipo de trabajo
        equipo = Equipo.objects.get(sprint_id=sp_pk)
        # Marcar elementos ya seleccionados
        formEquipo.initial['miembros'] = equipo.miembros

    # Verificar si el metodo es POST
    if request.method == 'POST':
        # Obtener el formulario rellenado
        formEquipo = CrearEquipo(request.POST)
        # Verficar formulario
        if formEquipo.is_valid():
            # obtener el modelo en base al formulario rellenado
            equipoNuevo = formEquipo.save(commit=False)
            # Si ya existe un equipo
            if Equipo.objects.filter(sprint_id=sp_pk):
                # Obtener el equipo de trabajo
                equipo = Equipo.objects.get(sprint_id=sp_pk)
                equipo.sprint = sprint

    else:
        return render(request, 'crearEquipo.html', {'formEquipo': formEquipo, 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos})

