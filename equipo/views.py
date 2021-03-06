from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib.auth.models import Group
from django.http import JsonResponse, HttpResponseRedirect, request
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, HttpResponse, get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.urls import reverse

from equipo.forms import *
from equipo.models import Equipo
from miembros.models import Miembro
from project.models import Proyecto
from sprint.models import Sprint
from sprintPlanning.models import *

# Importaciones para fechas
import numpy as np
import datetime


# def crearEquipo(request, pk, sp_pk):
#     """
#     Vista basa en función para la creación de un Equipo que conforma un sprint asignando miembros al equipo
#     :param request:
#     :param pk:
#     :param sp_pk:
#     :return:
#     """
#     # Proyecto al que pertenece
#     proyecto = Proyecto.objects.get(id=pk)
#     # Sprint para el cual se crea el equipo
#     sprint = Sprint.objects.get(id=sp_pk)
#     # Ver si es un miembro del proyecto
#     if Miembro.objects.filter(user=request.user.id):
#         # obtener su usuario
#         user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
#     else:
#         # si no es miembro se analizan los permisos de sistema
#         user = request.user
#     # obtener sus permisos
#     permisos = user.rol.list_permissions().order_by('id')
#
#     # Obtener todos los miembros válidos para trabajar en un sprint, estos no pueden ser aquellos usuarios que sean product owner, scrum master o usuarios sin roles de proyecto
#     miembros = Miembro.objects.filter(rol__project_id=pk, activo=True).exclude(rol__name='Scrum Master').exclude(rol__name='Product Owner').exclude(rol__name='')
#
#     # Si ya existe un Equipo asociado al Sprint
#     if Equipo.objects.filter(sprint_id=sp_pk):
#         # Obtener el equipo de trabajo
#         equipo = Equipo.objects.get(sprint_id=sp_pk)
#         # Crear un formulario para el equipo existente
#         formEquipo = CrearEquipo(instance=equipo)
#     else:
#         # Crear un formulario vacío
#         formEquipo = CrearEquipo()
#     # Asignar lista de miembros seleccionables
#     formEquipo.fields['miembros'].queryset = miembros
#     # Si ya existe un equipo
#     if Equipo.objects.filter(sprint_id=sp_pk):
#         # Obtener el equipo de trabajo
#         equipo = Equipo.objects.get(sprint_id=sp_pk)
#         # Marcar elementos ya seleccionados
#         formEquipo.initial['miembros'] = equipo.miembros
#
#     # Verificar si el metodo es POST
#     if request.method == 'POST':
#         # Obtener el formulario rellenado
#         formEquipo = CrearEquipo(request.POST)
#         # Verficar formulario
#         if formEquipo.is_valid():
#             # obtener el modelo en base al formulario rellenado
#             equipoNuevo = formEquipo.save(commit=False)
#             # Si ya existe un equipo
#             if Equipo.objects.filter(sprint_id=sp_pk):
#                 # Obtener el equipo de trabajo
#                 equipo = Equipo.objects.get(sprint_id=sp_pk)
#                 equipo.sprint = sprint
#
#     else:
#         return render(request, 'crearEquipo.html', {'formEquipo': formEquipo, 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos})


class crear_equipo(LoginRequiredMixin, CreateView):
    # permission_required = 'add_equipo'
    model = Equipo
    form_class = CrearEquipo
    template_name = 'crearEquipo.html'

    def get_success_url(self):
        Proyecto = self.kwargs['pk']
        Sprint = self.kwargs['sp_pk']
        user = Miembro.objects.get(rol__project_id=self.kwargs['pk'], user=self.request.user.id)
        # Si tiene permiso para agregar US al sprint
        if user.has_perm('charge_sprintplanning'):
            return reverse_lazy('sprintpaso3', kwargs={'pk': Proyecto, 'sp_pk': Sprint})
        # Si no tiene permiso se le redirige al sprint
        else:
            return reverse_lazy('sprintKanban', kwargs={'pk': Proyecto, 'sp_pk': Sprint})

    def get_context_data(self, **kwargs):
        context = super(crear_equipo, self).get_context_data(**kwargs)
        context['Proyecto'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        context['Sprint'] = Sprint.objects.get(id=self.kwargs['sp_pk'])
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

    def form_valid(self, form):
        if form.is_valid():
            data=form.save(commit=False)
            data.sprint=Sprint.objects.get(id=self.kwargs['sp_pk'])
            data.save()
            form.save_m2m()
            miembros=data.miembros.all()
            suma= 0
            for mi in miembros:
                suma= suma + mi.horaTrabajo
            data.capacidad= np.busday_count(data.sprint.fecha_incio, data.sprint.fecha_fin, weekmask='1111110') * suma
            data.save()
            s_p=SprintPlanning.objects.get(sprint_id=self.kwargs['sp_pk'])
            s_p.paso=3
            s_p.save()
            return HttpResponseRedirect(self.get_success_url())
        return self.render_to_response(self.get_context_data(form=form))

    def get_form_kwargs(self):
        kwargs = super(crear_equipo, self).get_form_kwargs()
        kwargs['request'] =self.kwargs['pk']
        return kwargs

class edit_equipo(LoginRequiredMixin,UpdateView):
    model = Equipo
    form_class = EditarEquipoForm
    template_name = 'editar_equipo.html'
    pk_sched_kwargs = 'eq_pk'  # Definir el nombre del parametro obtenido en la url

    def get_success_url(self):
        Proyecto = self.kwargs['pk']
        Sprint = self.kwargs['sp_pk']
        # # Creacion de un equipo
        # equipo = Equipo()
        # # Asignacion del equipo al sprint
        # equipo.sprint = Sprint.objects.get(id=self.kwargs['pk'])
        # # Persistencia del equipo
        # equipo.save()
        return reverse_lazy('sprintKanban', kwargs={'pk': Proyecto, 'sp_pk': Sprint})

    def get_object(self, queryset=None):
        id = int(self.kwargs.get(self.pk_sched_kwargs, None))
        obj = get_object_or_404(Equipo, pk=id)
        return obj


    def get_context_data(self, **kwargs):
        context = super(edit_equipo, self).get_context_data(**kwargs)
        context['Proyecto'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        context['Sprint'] = Sprint.objects.get(id=self.kwargs['sp_pk'])
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

    def form_valid(self, form):
        if form.is_valid():
            data = form.save(commit=False)
            data.sprint = Sprint.objects.get(id=self.kwargs['sp_pk'])
            data.save()
            equipo = Equipo.objects.get(id=self.kwargs['eq_pk'])

            form.save_m2m()
            for us in Sprint.objects.get(id=self.kwargs['sp_pk']).us.all():
                if us.user not in equipo.miembros.all():
                    equipo.miembros.add(us.user)
            miembros = data.miembros.all()
            suma = 0
            for mi in miembros:
                suma = suma + mi.horaTrabajo
            data.capacidad = np.busday_count(data.sprint.fecha_incio, data.sprint.fecha_fin, weekmask='1111110') * suma
            data.save()
            return HttpResponseRedirect(self.get_success_url())
        return self.render_to_response(self.get_context_data(form=form))

    def get_form_kwargs(self):
        kwargs = super(edit_equipo, self).get_form_kwargs()
        kwargs['request'] = self.kwargs['eq_pk']
        return kwargs


class delete_equipo(DeleteView):
    model = Equipo
    template_name = 'delete.html'
    pk_sched_kwargs = 'eq_pk'  # Definir el nombre del parametro obtenido en la url

    def get_success_url(self):
        Proyecto = self.kwargs['pk']
        Sprint = self.kwargs['sp_pk']
        # # Creacion de un equipo
        # equipo = Equipo()
        # # Asignacion del equipo al sprint
        # equipo.sprint = Sprint.objects.get(id=self.kwargs['pk'])
        # # Persistencia del equipo
        # equipo.save()
        return reverse_lazy('contenedor_pasos', kwargs={'pk': Proyecto, 'sp_pk': Sprint})

    def get_object(self, queryset=None):
        id = int(self.kwargs.get(self.pk_sched_kwargs, None))
        obj = get_object_or_404(Equipo, pk=id)
        return obj


class equipoView(ListView):
    model = Equipo
    template_name = 'equipo_listar.html'

    def get_context_data(self, **kwargs):
        context = super(equipoView, self).get_context_data(**kwargs)
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
        sprint=Sprint.objects.get(id=self.kwargs['sp_pk'])
        context['sprint'] =sprint
        equ=Equipo.objects.get(sprint__id=self.kwargs['sp_pk'])
        context['equipo'] = equ

        return context
class miembrosView(ListView):
    model = Miembro
    template_name = 'vermiembroequipo.html'

    def get_context_data(self, **kwargs):
        context = super(miembrosView, self).get_context_data(**kwargs)
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
        sprint=Sprint.objects.get(id=self.kwargs['sp_pk'])
        context['sprint'] =sprint
        equ=Equipo.objects.get(sprint__id=self.kwargs['sp_pk'])
        context['equipo'] = equ

        return context

    def get_queryset(self):
        equi= Equipo.objects.get(id=self.kwargs['eq_pk'])
        object_list= equi.miembros.all()
        return object_list
