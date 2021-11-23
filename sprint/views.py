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
    print(context)
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

        context['create_no']=Sprint.objects.filter(proyecto_id=self.kwargs['pk'],estado=1).exists()

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
        Sprint=self.kwargs['sp_pk']
        return reverse_lazy('sprintKanban', kwargs={'pk': Proyecto,'sp_pk':Sprint})

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

        sprint=Sprint.objects.get(pk=self.kwargs['sp_pk'])
        context['permisos'] = permisos
        context['sprint'] = sprint
        tieneEquipo = Equipo.objects.filter(sprint_id=self.kwargs['sp_pk']).exists()
        context['tieneEquipo'] = tieneEquipo
        product_backlog = sprint.us.all() #Us.objects.all().filter(project_id=self.kwargs['pk'], activo=True)
        context['ProductBacklog'] = product_backlog
        # Ultimo estado de los US durante el Sprint
        context['historiales'] = []
        # Por cada us del sprint Backlog
        for US in product_backlog:
            # Asignar su ultimo historial del us durante el sprint
            context['historiales'].append(HistorialUs.objects.filter(ustory__id=US.id).order_by('-id').first())
        print(context['historiales'])
        m = Miembro.objects.get(user=self.request.user,rol__project_id=self.kwargs['pk'])
        is_scrum = str(m.rol) == 'Scrum Master'
        context['is_scrum']=is_scrum
        # Determinar si existen User Stories no estimados
        us = Sprint.objects.get(pk=self.kwargs['sp_pk']).us.all().filter(storypoints=None).exists()
        # Determinar si existen User Stories en el sprint
        has_us = Sprint.objects.get(pk=self.kwargs['sp_pk']).us.all().exists()
        context['iniciar'] = not(Sprint.objects.filter(proyecto_id=self.kwargs['pk'], estado=2).exists()) and not(us) and has_us
        context['paso'] = SprintPlanning.objects.get(sprint_id=self.kwargs['sp_pk']).paso
        if Sprint.objects.get(pk=self.kwargs['sp_pk']).fecha_fin is not None:
            context['dias'] = np.busday_count(datetime.date.today(), Sprint.objects.get(pk=self.kwargs['sp_pk']).fecha_fin,
                                          weekmask='1111110') + 1
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
                    if is_scrum:
                        if (est_nuevo - est_actual == 1 or est_nuevo - est_actual == -2) and est_actual != 4:
                            if (est_nuevo == 4 or est_nuevo == 1):
                                UStory.set_estado(request.POST['estado'])
                                UStory.save()
                    else:
                        if est_nuevo - est_actual == 1:
                            UStory.set_estado(request.POST['estado'])
                            UStory.save()
                    # Descomentar para hacer los cambios de estado manualmente sin las restricciones
                    # UStory.set_estado(request.POST['estado'])
                    # UStory.save()
                except KeyError:
                    HttpResponseServerError("Malformed data!")

                return JsonResponse({"success": True}, status=200)
        elif sprint.estado == 1:
            s = Sprint.objects.get(pk=self.kwargs['sp_pk'])
            s.estado = 2
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
