from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib.auth.models import Group
from django.http import JsonResponse, HttpResponseRedirect, request, HttpResponseServerError
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.shortcuts import render, HttpResponse, get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.urls import reverse

# Importaciones para fechas
import numpy as np

from roles.mixins import *

from sprint.models import *
from project.models import *
from sprint.forms import *
from miembros.models import *
from equipo.models import *
from sprintPlanning.models import *
from us.models import HistorialUs
from tests.test_email import send_email

from tarea.models import *

# importacion de las dependencias para el grafico  burndownchart
import matplotlib.pyplot as plt
import numpy as np
import datetime


#TRATAR DE VER COMO HACER CUANDO EL SPRINT DURA MAS DE LO ESPERADO

def ver_burndownchart(request, pk, sp_pk):

    proj = Proyecto.objects.get(id=pk)
    user = request.user
    sprint = Sprint.objects.get(id=sp_pk)
    # falta agregar de que sprint viene
    us = Us.objects.filter(project=pk, user=user.id)
    tarea = Tarea.objects.filter(sprimt=sp_pk)
    context = {
        'Us': us,
        'User': user,
        'sprint': sprint,
        'Tarea': tarea,
        'Proyecto': proj,
    }


    # PARAMETROS PARA EL GRAFICO DEL BURNDOWNCHART IDEAL
    # calculo del sp del sprint
    sp = 0

    # se van sumando todos los storypoints de cada us
    for objeto in sprint.us.all():
        # traemos el ultimo historial suyo
        histo = HistorialUs.objects.filter(ustory=objeto.id).last().storypoints
        if(histo is None): # si es none sumamos cero
            sp = sp + 0
        else: # sino sumamos el valor devuelto
            sp = sp + histo

    #calculo de la duracion del sprint
    fecha_inicio = sprint.fecha_incio
    fecha_fin = sprint.fecha_fin

    # duracion del sprint en dias
    #dias = (fecha_fin-fecha_inicio).days
    dias = np.busday_count(fecha_inicio, fecha_fin, weekmask='1111110')
    # generacion del eje x del burndownchart
    x1 = np.arange(0, dias+1, 1)
    # funcion del eje y
    y1 = sp - (sp*x1/dias)

    figura, ax1 = plt.subplots()
    ax1.plot(x1, y1, label='Linea ideal')

    # seran listas que contendran los valores a ser ploteados
    x2 = []
    y2 = []

    # los valores iniciales de x y de y sí son conocidos

    # el valor inicial de x debe ser 0
    x2.append(0)
    # el valor inicial de y debe ser igual a la cantidad de storypoints a ser realizados
    y2.append(sp)

    dic = {}

    for objeto in tarea:
        ultimo = HistorialTarea.objects.filter(tarea=objeto.id).last()
        dic[(ultimo.fecha_modificacion).date()] = dic.get((ultimo.fecha_modificacion).date(), 0) + ultimo.hora

    aux = sp
    j = 1

    for clave, valor in dic.items():
        if( (fecha_fin - clave).days >= 0 ):
            print("El valor es: ", valor)
            aux = aux - valor
            y2.append(aux)
            print("La clave es: ", clave)
            if ((clave - fecha_inicio).days == j):
                x2.append(j)
                j = j + 1
            else:
                while ((clave - fecha_inicio).days != j):
                    j = j + 1
                x2.append(j)
        else:
            # cambiamos la fecha fin
            print(type(fecha_fin))
            print(type(clave))
            fecha_fin = clave
            print("fecha inicio: ", fecha_inicio)
            print("fecha fin nuevo: ", fecha_fin)
            # luego recalculamos los dias que contiene el sprint
            dias = np.busday_count(fecha_inicio, fecha_fin, weekmask='1111110') + 1
            # generacion del eje x del burndownchart
            x1 = np.arange(0, dias + 1, 1)
            print("nuevo dias: ", dias)
            print("x1: ", x1)
            # funcion del eje y
            y1 = sp - (sp * x1 / dias)

            figura, ax1 = plt.subplots()
            ax1.plot(x1, y1, label='Linea ideal')


            print("El valor es: ", valor)
            aux = aux - valor
            y2.append(aux)
            print("La clave es: ", clave)
            if ((clave - fecha_inicio).days == j):
                x2.append(j)
                j = j + 1
            else:
                while ((clave - fecha_inicio).days != j):
                    j = j + 1
                x2.append(j)


    print(x2)
    print(y2)

    ax1.plot(x2, y2, label='Linea real')

    ax1.set(
        xlabel='Días',
        ylabel='StoryPoints',
        title='Gráfico del Burndownchart'
    )

    ax1.grid()
    ax1.legend()

    figura.savefig("sprint/static/img/burndownchart.png")


    return render(request, 'burndown_chart.html', context=context)


def sprint_backlog_view(request, pk, sp_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    # Filtar los us por proyecto
    # us = Us.objects.filter(project=pk).exclude(activo=False)
    sprint = Sprint.objects.get(id=sp_pk)
    us = sprint.us.all()
    proj = Proyecto.objects.get(id=pk)
    user = request.user
    context = {
        'Us': us,
        'User': user,
        'Proyecto': proj,
        'sprint': sprint,
        'permisos': permisos,
    }
    return render(request, 'Sprint_backlog.html', context=context)


class sprintView(ListView):
    model = Sprint
    template_name = 'sprint_view.html'

    def get_context_data(self, **kwargs):
        context = super(sprintView, self).get_context_data(**kwargs)
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
        if Sprint.objects.filter(proyecto_id=self.kwargs['pk'], estado=1):
            Us_sprint = Sprint.objects.get(proyecto_id=self.kwargs['pk'], estado=1).us.all()
            print( Us.objects.filter(project_id=self.kwargs['pk'], estado=1, activo=True).difference(Sprint.objects.get(proyecto_id=self.kwargs['pk'], estado=1).us.all()) )
        context['create'] = not Sprint.objects.filter(proyecto_id=self.kwargs['pk'], estado=1).exists() and Us.objects.filter(project_id=self.kwargs['pk'], estado=1, activo=True)

        context['permisos'] = permisos
        return context

    def get_queryset(self):
        object_list = Sprint.objects.filter(proyecto_id=self.kwargs['pk'])
        return object_list


class sprintView_Kanban(ListView):
    model = Sprint
    template_name = 'sprint_kanban.html'

    def get_success_url(self):
        Proyecto = self.kwargs['pk']
        Sprint = self.kwargs['sp_pk']
        return reverse_lazy('sprintKanban', kwargs={'pk': Proyecto, 'sp_pk': Sprint})

    def get_context_data(self, **kwargs):
        context = super(sprintView_Kanban, self).get_context_data(**kwargs)
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

        sprint = Sprint.objects.get(pk=self.kwargs['sp_pk'])
        context['permisos'] = permisos
        context['sprint'] = sprint
        tieneEquipo = Equipo.objects.filter(sprint_id=self.kwargs['sp_pk']).exists()
        context['tieneEquipo'] = tieneEquipo
        miembro = Miembro.objects.get(user=self.request.user, rol__project_id=self.kwargs['pk'])


        product_backlog = sprint.us.filter(user=miembro)
        print('name:',miembro.rol.name)
        if miembro.rol.name == 'Scrum Master':
            product_backlog = sprint.us.all()
        # Us.objects.all().filter(project_id=self.kwargs['pk'], activo=True)

        context['ProductBacklog'] = product_backlog
        # Ultimo estado de los US durante el Sprint
        context['historiales'] = []
        # Por cada us del sprint Backlog
        for US in product_backlog:
            # Asignar su ultimo historial del us durante el sprint
            context['historiales'].append(HistorialUs.objects.filter(ustory__id=US.id, sprint__id=sprint.id).order_by('-id').first())
        m = Miembro.objects.get(user=self.request.user,rol__project_id=self.kwargs['pk'])
        is_scrum = str(m.rol) == 'Scrum Master'
        context['is_scrum']=is_scrum
        # Determinar si existen User Stories no estimados
        us = Sprint.objects.get(pk=self.kwargs['sp_pk']).us.all().filter(storypoints=None).exists()
        # Determinar si existen User Stories en el sprint
        has_us = Sprint.objects.get(pk=self.kwargs['sp_pk']).us.all().exists()
        context['iniciar'] = not(Sprint.objects.filter(proyecto_id=self.kwargs['pk'], estado=2).exists()) and not(us) and has_us and sprint.fecha_incio < sprint.fecha_fin
        context['finalizar'] = not Sprint.objects.get(pk=self.kwargs['sp_pk']).us.all().filter(estado=3).exists()
        context['paso'] = SprintPlanning.objects.get(sprint_id=self.kwargs['sp_pk']).paso
        if Sprint.objects.get(pk=self.kwargs['sp_pk']).fecha_fin is not None and sprint.estado != 3:
            context['dias'] = np.busday_count(datetime.date.today(), Sprint.objects.get(pk=self.kwargs['sp_pk']).fecha_fin,
                                          weekmask='1111110')
        else:
            context['dias'] = 0
        return context

    def post(self, request, *args, **kwargs):
        m = Miembro.objects.get(user=request.user,rol__project_id=self.kwargs['pk'])
        is_scrum = str(m.rol) == 'Scrum Master'
        sprint = Sprint.objects.get(pk=self.kwargs['sp_pk'])

        if sprint.estado == 2:
            if request.is_ajax():
                print(request.POST['estado'])
                try:

                    UStory = Us.objects.get(id=request.POST['id'])
                    # la diferencia entre cambios de estados no mayor a 1 solo para avanzar
                    # para retroceder no puede ser
                    est_actual = int(UStory.estado)
                    est_nuevo = int(request.POST['estado'])
                    proj = str(self.kwargs['pk'])
                    spr = str(self.kwargs['sp_pk'])
                    Creador = Miembro.objects.get(rol__project_id=self.kwargs['pk'], rol__name='Scrum Master')
                    print('correo:', Creador.user.email)
                    if is_scrum:
                        if (est_nuevo - est_actual == 1 or est_nuevo - est_actual == -2) and est_actual != 4:
                            if (est_nuevo == 4 or est_nuevo == 1):
                                if est_nuevo == 4:
                                    msj= 'El User Story ' + UStory.name + 'fue aceptado'
                                    send_email(Creador.user.email, msj)
                                if est_nuevo == 1:
                                    msj = 'El User Story ' + UStory.name + 'fue rechazado'
                                    send_email(Creador.user.email, msj)
                                UStory.set_estado(request.POST['estado'])
                                UStory.save()
                                ultimo_historial = HistorialUs.objects.filter(ustory_id=UStory.id).last()
                                ultimo_historial.sprint = sprint
                                ultimo_historial.save()
                    else:
                        if est_nuevo - est_actual == 1:
                            UStory.set_estado(request.POST['estado'])
                            print('est', request.POST['estado'])
                            if (int(request.POST['estado']) == 3):

                                # us=str(self.kwargs['us_pk'])
                                mensaje = 'El sprint ' + spr + ' del Proyecto ' + proj + ' tiene pendiente por evaluar el US ' + UStory.name
                                print(mensaje)
                                send_email(Creador.user.email, mensaje)

                            UStory.save()
                            ultimo_historial = HistorialUs.objects.filter(ustory_id=UStory.id).last()
                            ultimo_historial.sprint = sprint
                            ultimo_historial.save()
                    # Descomentar para hacer los cambios de estado manualmente sin las restricciones
                    # UStory.set_estado(request.POST['estado'])
                    # UStory.save()
                except KeyError:
                    HttpResponseServerError("Malformed data!")

                return JsonResponse({"success": True}, status=200)
            else:
                # Finalizacion de Sprint

                # Todos los us del sprint
                for us in Sprint.objects.get(pk=self.kwargs['sp_pk']).us.all():
                    # Los us en TODO o DOING
                    if us.estado == 1 or us.estado == 2:
                        # Cambiar prioridad
                        us.prioridad = 5
                        # Quitar usuario asignado
                        us.user = None
                        us.estado=1
                        # Asignar al siguiente sprint los US no finalizados
                        if Sprint.objects.filter(proyecto_id=self.kwargs['pk'], estado=1).exists():
                            next_sp = Sprint.objects.get(proyecto_id=self.kwargs['pk'], estado=1)
                            next_sp.us.add(us)
                            # Borrar Estimacion
                            us.storypoints = None
                            us.save()
                            ultimo_historial = HistorialUs.objects.filter(ustory_id=us.id).last()
                            ultimo_historial.sprint = next_sp
                            ultimo_historial.save()
                        else:
                            us.save()
                            ultimo_historial = HistorialUs.objects.filter(ustory_id=us.id).last()
                            ultimo_historial.sprint = sprint
                            ultimo_historial.save()
                # Asignar fecha de finalizacion y estado finalizado
                sprint.fecha_fin = datetime.date.today()
                sprint.estado = 3
                sprint.save()
                # Control de fecha de inicio del siguiente Sprint
                if Sprint.objects.filter(proyecto_id=self.kwargs['pk'], estado=1).exists():
                    next_sp = Sprint.objects.get(proyecto_id=self.kwargs['pk'], estado=1)
                    # Si la fecha de inicio del siguiente es menor a lafecha de finalizacion del actual movemos la fecha
                    # de inicio del siguiente sprint
                    if next_sp.fecha_incio is not None:
                        if next_sp.fecha_incio < sprint.fecha_fin:
                            next_sp.fecha_incio = sprint.fecha_fin
                            next_sp.save()
                return HttpResponseRedirect(self.get_success_url())
        elif sprint.estado == 1:
            s = Sprint.objects.get(pk=self.kwargs['sp_pk'])
            s.estado = 2
            s.fecha_incio = datetime.date.today()
            s.save()
            return HttpResponseRedirect(self.get_success_url())



class crear_sprint(LoginRequiredMixin, CreateView):
    permission_required = 'add_sprint'
    model = Sprint
    form_class = crearSprintForm
    template_name = 'create_sprint.html'

    def get_success_url(self):
        Proyecto = self.kwargs['pk']
        # Creacion de un equipo
        # equipo = Equipo()
        # Asignacion del equipo al sprint
        # equipo.sprint = Sprint.objects.get(id=self.kwargs['pk'])
        # Persistencia del equipo
        # equipo.save()
        return reverse_lazy('sprintlist', kwargs={'pk': Proyecto})

    # def get_initial(self):
    #     initial = super(crear_us, self).get_initial()
    #     initial['project'] = Proyecto.objects.get(pk=self.kwargs['pk'])
    #     initial['estado']=Us.status[0]
    #     print('inicial:', initial)
    #     return initial
    def get_context_data(self, **kwargs):
        context = super(crear_sprint, self).get_context_data(**kwargs)
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

    def post(self, request, *args, **kwargs):
        self.object = self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
            data = form.save(commit=False)
            sprints = Sprint.objects.filter(proyecto_id=self.kwargs['pk'])
            for sp in sprints:
                if sp.name == data.name and sp.id != data.id:
                    error = 'Error! Nombre de Sprint ya existente '
                    messages.error(request, error)
                    return self.render_to_response(self.get_context_data(form=form))
            data = form.save(commit=False)
            # print('dfgdfgd',data.project)
            data.proyecto = Proyecto.objects.get(pk=self.kwargs['pk'])
            # data.estado=Us.status[0][0]
            data.save()
            sprint_plannig=SprintPlanning.objects.create(sprint=data,)

            return HttpResponseRedirect(self.get_success_url())
        return self.render_to_response(self.get_context_data(form=form))

# @login_required(login_url='login')
# def us(request,pk):
#     us=Us.objects.filter(project=pk) #Filtar los us por proyecto
#     #us = Us.objects.all() # Todos los us creados
#     proj=Proyecto.objects.get(id=pk)
#     user=request.user
#     crear=user.has_perm('add_us')
#     editar=user.has_perm('change_us')
#     eliminar=user.has_perm('delete_us')
#     context={
#         'Us':us,
#         'User':user,
#         'Proj':proj,
#         'crear':crear,
#         'editar':editar,
#         'eliminar':eliminar,
#     }
#     print (context)
#     return render(request,'us.html',context=context)


# class crear_us(LoginRequiredMixin,ValidatePermissionRequiredMixin, CreateView):
#     permission_required = 'add_us'
#     model = Us
#     form_class = crearUsForm
#     template_name = 'create_us.html'
#
#     def get_success_url(self):
#         print('entro aca?')
#         proj_id= self.kwargs['pk']
#         return reverse_lazy('us', kwargs={'pk': proj_id})
#     def get_initial(self):
#         initial = super(crear_us, self).get_initial()
#         initial['project'] = Proyecto.objects.get(pk=self.kwargs['pk'])
#         initial['estado']=Us.status[0]
#         print('inicial:', initial)
#         return initial
#     def get_context_data(self, **kwargs):
#         context = super(crear_us, self).get_context_data(**kwargs)
#         context['proj'] = Proyecto.objects.get(pk=self.kwargs['pk'])
#         return context
#     def post(self, request, *args, **kwargs):
#         self.object=self.get_object
#         form = self.form_class(request.POST)
#         if form.is_valid():
#             data=form.save(commit=False)
#             print('dfgdfgd',data.project)
#             data.project=Proyecto.objects.get(pk=self.kwargs['pk'])
#             data.estado=Us.status[0][0]
#             data.save()
#             return HttpResponseRedirect(self.get_success_url())
#         return self.render_to_response(self.get_context_data(form=form))
# class Us_Delete(LoginRequiredMixin,ValidatePermissionRequiredMixin, DeleteView):
#     permission_required ='delete_Us'
#     model = Us
#     template_name = 'delete_us.html'
#     pk_sched_kwargs = 'us_pk'  # Definir el nombre del parametro obtenido en la url
#
#     def get_object(self, queryset=None):
#         id = int(self.kwargs.get(self.pk_sched_kwargs, None))
#         obj = get_object_or_404(Us, pk=id)
#         return obj
#
#     def get_success_url(self):
#         proj_id = self.kwargs['pk']
#         return reverse_lazy('us', kwargs={'pk': proj_id})
#     def get_context_data(self, **kwargs):
#         context = super(Us_Delete, self).get_context_data(**kwargs)
#         context['proj'] = Proyecto.objects.get(pk=self.kwargs['pk'])
#         print(context)
#         return context
# class editUs(LoginRequiredMixin,ValidatePermissionRequiredMixin,UpdateView):
#     permission_required = 'change_Us'
#     model = Us
#     form_class = editUsForm
#     template_name = 'editar_us.html'
#     pk_sched_kwargs = 'us_pk' #Definir el nombre del parametro obtenido en la url
#
#     def get_object(self, queryset=None):
#         id = int(self.kwargs.get(self.pk_sched_kwargs, None))
#         obj = get_object_or_404(Us, pk=id)
#         return obj
#
#     def get_success_url(self):
#         proj_id= self.kwargs['pk']
#         return reverse_lazy('us', kwargs={'pk': proj_id})
#
#     def get_context_data(self, **kwargs):
#         context = super(editUs, self).get_context_data(**kwargs)
#         context['proj'] = Proyecto.objects.get(pk=self.kwargs['pk'])
#         return context
