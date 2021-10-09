import datetime

from django.shortcuts import render, redirect
from django.contrib import messages
from miembros.models import Miembro
from project.models import Proyecto
from sprint.models import Sprint
from sprintPlanning.forms import primerpasoplanificarSprint


def modificar_sprintplanni(request, pk, sp_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    # Optener sprint de la cual se va a planificar
    sprint = Sprint.objects.get(id=sp_pk)
    #Optener formulario un sprint ya existente antes de comenzar
    sprin_form = primerpasoplanificarSprint(instance=sprint)
    # Optener la clase proyecto en la cual se esta trabajndo
    pro = Proyecto.objects.get(id=pk)
    # Metodo POS
    if request.method == 'POST':
        # Obtener formulario cargado
        FormularioSprint = primerpasoplanificarSprint(request.POST)
        # Obtener el modelo del formulario
        nuevosp = FormularioSprint.save(commit=False)
        # Validación de fecha inicio menor a fecha fin
        if nuevosp.fecha_incio >= nuevosp.fecha_fin:
            error = 'Error! Fecha inicio mayor a fecha fin: La fecha de fin debe de ser mayor a la fecha inicio'
            messages.error(request, error)
            return redirect('sprintpaso1', pk=pk, sp_pk=sp_pk)
        # Validación de fecha inicio mayor a la fecha actual
        if nuevosp.fecha_incio <= datetime.date.today():
            error = 'Error! Fecha inicio debe ser mayor a la fecha actual '
            messages.error(request, error)
            return redirect('sprintpaso1', pk=pk, sp_pk=sp_pk)
        # Validación de fecha fecha fin mayor a fecha inicio
        if nuevosp.fecha_fin >= pro.fecha_fin:
            error = 'Error! Fecha Fin debe ser menor a la fecha de finalacición del proyecto '
            messages.error(request, error)
            return redirect('sprintpaso1', pk=pk, sp_pk=sp_pk)
        # Obtener el sprint que ya a comenzado y el proyecto de la cual se esta trabajando
        inici= Sprint.objects.filter(estado=2, proyecto_id=pk)
        if len(inici)>0:
            inici=inici[0]
            if nuevosp.fecha_incio <= inici.fecha_fin:
                error = 'Error! La fecha de inicio no puede empezar antes que la fecha fin del sprint que está en marcha '
                messages.error(request, error)
                return redirect('sprintpaso1', pk=pk, sp_pk=sp_pk)
        sprints= Sprint.objects.filter(proyecto_id= pk)
        for sp in sprints:
            if sp.name == nuevosp.name:
                error = 'Error! Nombre de Sprint ya existente '
                messages.error(request, error)
        sprint.fecha_incio= nuevosp.fecha_incio
        sprint.fecha_fin= nuevosp.fecha_fin
        sprint.name= nuevosp.name
        sprint.save()
        return redirect('sprintlist', pk=pk)
    else:
        FormularioUserStory = primerpasoplanificarSprint(request.GET)
        return render(request, 'create_us.html', {'form': sprin_form, 'Proyecto': Proyecto.objects.get(pk= pk), 'permisos': permisos})





