import datetime

from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.urls import reverse_lazy
from django.views.generic import UpdateView

from equipo.models import Equipo
from miembros.models import Miembro
from project.models import Proyecto
from sprint.models import Sprint
from sprintPlanning.forms import primerpasoplanificarSprint, tercerpasoplanificarSprint, PlanificarUs
from us.models import Us


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

'''
def asignarus(request, pk, sp_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    #Obtener los us de aquellos que no han sido finalizado
    uss = Us.objects.filter(project_id=pk).exclude(estado=4)
    # Optener sprint de la cual se va a planificar
    sprint = Sprint.objects.get(id=sp_pk)
    # Optener formulario un sprint ya existente antes de comenzar
    sprint_form = tercerpasoplanificarSprint(instance=sprint)
    if request.method == 'POST':
        # Obtener formulario cargado
        FormularioSprint = tercerpasoplanificarSprint(request.POST)
        # Obtener el modelo del formulario
        nuevosp = FormularioSprint.save(commit=False)
'''
class asignarUs(UpdateView):
    #Obtener la clase sprint
    model = Sprint
    #Validar mi formulario
    form_class = tercerpasoplanificarSprint
    #Agregar el html
    template_name = 'sptercerpaso.html'

    pk_sched_kwargs = 'sp_pk'  # Definir el nombre del parametro obtenido en la url
    # Deteción de error
    def get_object(self, queryset=None):
        id = int(self.kwargs.get(self.pk_sched_kwargs, None))
        obj = get_object_or_404(Sprint, pk=id)
        return obj
    # Validación de la url
    def get_success_url(self):
        proj_id = self.kwargs['pk']
        return reverse_lazy('sprintlist', kwargs={'pk': proj_id})
    # Metodo para filtar los permisos selecionado y el id del proyecto que se esta trabajando
    def get_context_data(self, **kwargs):
        context = super(asignarUs, self).get_context_data(**kwargs)
        #Obtemos el id de nuestro proyecto
        context['Proyecto'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        # Ver si es un miembro del proyecto
        if Miembro.objects.filter(user=self.request.user.id):
            # obtener su usuario
            user = Miembro.objects.get(rol__project_id=self.kwargs['pk'], user=self.request.user.id)
        else:
            # si no es miembro se analizan los permisos de sistema
            user = self.request.user
        # obtener sus permisos
        permisos = user.rol.list_permissions().order_by('id')
        context['permisos'] = permisos
        return context

def listarus(request, pk, sp_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    # Obtenemos el modelo de nuestro sprint
    sprint = Sprint.objects.get(id=sp_pk)
    #lista de US selecionado
    us_list=Us.objects.filter(project_id=pk, sprint__id=sp_pk)
    #cal=0
    #for us in us_list:
     #   cal= cal + us.storypoints
    #equi= Equipo.objects.get(sprint__id=sp_pk)
    error =None
    #if equi.capacidad < cal:
    #    error='Capacida superada'
    return render(request, 'listausplanificar.html', {'error': error, 'uslista': us_list,'Sprint': Sprint.objects.get(id=sp_pk), 'Proyecto': Proyecto.objects.get(pk= pk), 'permisos': permisos})
def planificarus(request, pk, sp_pk, us_pk):
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    # Optener sprint de la cual se va a planificar
    uss = Us.objects.get(id=us_pk)
    # Optener formulario un sprint ya existente antes de comenzar
    us_form = PlanificarUs(instance=uss)
    if request.method == 'POST':
        # Obtener formulario cargado
        Formularious = PlanificarUs(request.POST)
        # Obtener el modelo del formulario
        if Formularious.is_valid():
            nuevosp = Formularious.save(commit=False)
            uss.user= nuevosp.user
            uss.name= nuevosp.name
            uss.storypoints= nuevosp.storypoints
            uss.descripcion= nuevosp.descripcion
            uss.save()
            return redirect('listarus',pk=pk, sp_pk=sp_pk )
        return render(request, 'planificarus.html',
                      {'form': us_form, 'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos,'Sprint': Sprint.objects.get(id=sp_pk)})
    else:
        # Ver si es un miembro del proyecto
        return render(request, 'planificarus.html', {'form': us_form, 'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos, 'Sprint': Sprint.objects.get(id=sp_pk)})