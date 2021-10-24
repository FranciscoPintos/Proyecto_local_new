import datetime

from django.shortcuts import render, redirect, get_object_or_404,HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse_lazy
from django.views.generic import UpdateView, ListView

from equipo.models import Equipo
from miembros.models import Miembro
from project.models import Proyecto
from sprint.models import Sprint
from sprintPlanning.forms import primerpasoplanificarSprint, tercerpasoplanificarSprint, \
    planificacionUS_Scrum, estimarUS_desarrollador
from us.models import Us
from usuario.models import Usuario


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
        return render(request, 'spprimerpaso.html', {'form': sprin_form, 'Proyecto': Proyecto.objects.get(pk= pk),'Sprint': Sprint.objects.get(pk= sp_pk), 'permisos': permisos})

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
        return reverse_lazy("contenedor_pasos", kwargs={'pk': proj_id, 'sp_pk':self.kwargs['sp_pk']})
    # Metodo para filtar los permisos selecionado y el id del proyecto que se esta trabajando
    def get_context_data(self, **kwargs):
        context = super(asignarUs, self).get_context_data(**kwargs)
        #Obtemos el id de nuestro proyecto
        context['Proyecto'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        context['Sprint'] = Sprint.objects.get(pk=self.kwargs['sp_pk'])
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
    def get_form_kwargs(self):
        kwargs = super(asignarUs, self).get_form_kwargs()
        kwargs['request'] =self.kwargs['pk']
        return kwargs

    def form_valid(self, form):
        product = form.save(commit=False)

        #form.instance.MI_CAMPO = "MI VALOR"
        us_viejos_asignados= Sprint.objects.get(id=self.kwargs['sp_pk']).us.all()
        idsviejo=[]
        for ids in us_viejos_asignados:
            idsviejo.append(ids.id)
        #print(idsviejo)
        #form.instance.save()
        product.save()
        form.save_m2m()
        us_asignados = product.us.all()
        idsnuevo = []
        for ids in us_asignados:
            idsnuevo.append(ids.id)
        #print(idsnuevo)
        for us in idsviejo:
            if us not in idsnuevo:
                ustory= Us.objects.get(id=us)
                ustory.storypoints= None
                ustory.estimaciondesarrollador= None
                ustory.estimacionscrum= None
                ustory.user= None
                ustory.save()
        return super().form_valid(form)

class View_USasignado(ListView):
        model = Us
        template_name = 'listarUsasignado.html'

        def get_context_data(self, **kwargs):
            context = super(View_USasignado, self).get_context_data(**kwargs)
            context['Proyecto'] = Proyecto.objects.get(pk=self.kwargs['pk'])
            context['Sprint'] = Sprint.objects.get(pk=self.kwargs['sp_pk'])
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

            print(context)
            return context

        def get_queryset(self):
            user = Miembro.objects.get(rol__project_id=self.kwargs['pk'], user=self.request.user.id)
            namerol = user.rol.name
            sprimt = Sprint.objects.get(id=self.kwargs['sp_pk'])
            if namerol == "Scrum Master" or namerol == "Product Owner":
                us = Us.objects.filter(sprint__id=self.kwargs['sp_pk'], estado=1)
            else:
                us = Us.objects.filter(user_id=user.id, sprint__id=self.kwargs['sp_pk'], estado=1)
            object_list =us
            return object_list



'''
    def get_initial(self):
        initial = super().get_initial()
        initial['us'] = Us.objects.filter(project_id=self.kwargs['pk'], estado=1)
        return initial

    def post(self, request, *args, **kwargs):
        self.object=self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
            #data=form.save(commit=False)
            # print('dfgdfgd',data.project)

            # data.estado=Us.status[0][0]
            #data.save()
            form.save()
            return HttpResponseRedirect(self.get_success_url())
        return self.render_to_response(self.get_context_data(form=form))
'''

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
    miembro = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    namerol = miembro.rol.name
    # Optener formulario de un sprint ya existente antes de comenzar
    if namerol == "Scrum Master" or namerol == "Product Owner":
        us_form = planificacionUS_Scrum(instance=uss)
    else:
        us_form = estimarUS_desarrollador(instance=uss)

    if request.method == 'POST':
        # Optener formulario de un sprint ya existente antes de comenzar
        if namerol == "Scrum Master" or namerol == "Product Owner":
            Formularious = planificacionUS_Scrum(request.POST)
        else:
            Formularious = estimarUS_desarrollador(request.POST)
        # Obtener el modelo del formulario
        if Formularious.is_valid():
            nuevosp = Formularious.save(commit=False)
            if namerol == "Scrum Master" or namerol == "Product Owner":
                uss.user= nuevosp.user
                uss.estimacionscrum = nuevosp.estimacionscrum
            else:
                uss.estimaciondesarrollador = nuevosp.estimaciondesarrollador
                uss.storypoints = int((uss.estimacionscrum + uss.estimaciondesarrollador) / 2)
            uss.name= nuevosp.name
            uss.descripcion= nuevosp.descripcion
            uss.save()
            return redirect('listarus',pk=pk, sp_pk=sp_pk )
        return render(request, 'planificarus.html',
                      {'form': us_form, 'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos,'Sprint': Sprint.objects.get(id=sp_pk)})
    else:
        miembroequipo= Equipo.objects.get(sprint_id=sp_pk )
        if namerol == "Scrum Master" or namerol == "Product Owner":
            us_form.fields["user"].queryset = miembroequipo.miembros.all()
        # Ver si es un miembro del proyecto
        return render(request, 'planificarus.html', {'form': us_form, 'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos, 'Sprint': Sprint.objects.get(id=sp_pk)})


def contenedor_pasos(request, pk, sp_pk):
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    proyecto = Proyecto.objects.get(pk=pk)
    sprint = Sprint.objects.get(id=sp_pk)
    tieneEquipo = Equipo.objects.filter(sprint_id=sp_pk).exists()
    context ={
        'Proyecto':proyecto,
        'Sprint':sprint,
        'tieneEquipo':tieneEquipo,
        'permisos':permisos,
    }

    return render(request, 'contenedor_pasos.html', context)
def listadoparaestimar(request, pk, sp_pk):
    user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    namerol= user.rol.name
    if namerol == "Scrum Master" or namerol== "Product Owner":
        us = Us.objects.filter(sprint__id=sp_pk, estado=1)
    else:
        us = Us.objects.filter(user=user.user, sprint__id=sp_pk)
    print(us)