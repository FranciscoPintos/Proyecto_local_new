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

from equipo.forms import CrearEquipo
from equipo.models import Equipo
from miembros.models import Miembro
from project.models import Proyecto
from sprint.models import Sprint

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
    permission_required = 'add_equipo'
    model = Equipo
    form_class = CrearEquipo
    template_name = 'crearEquipo.html'

    def get_success_url(self):
        Proyecto = self.kwargs['pk']
        # # Creacion de un equipo
        # equipo = Equipo()
        # # Asignacion del equipo al sprint
        # equipo.sprint = Sprint.objects.get(id=self.kwargs['pk'])
        # # Persistencia del equipo
        # equipo.save()
        return reverse_lazy('sprintlist', kwargs={'pk': Proyecto})

    def get_context_data(self, **kwargs):
        context = super(crear_equipo, self).get_context_data(**kwargs)
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
        context['sprint'] = Sprint.objects.get(id=self.kwargs['sp_pk'])
        print(context)
        return context
    def post(self, request, *args, **kwargs):
        self.object=self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
            data=form.save(commit=False)
            data.sprint=Sprint.objects.get(id=self.kwargs['sp_pk'])
            data.save()
            form.save_m2m()
            return HttpResponseRedirect(self.get_success_url())
        return self.render_to_response(self.get_context_data(form=form))


class delete_equipo(DeleteView):
    model = Equipo
    template_name = 'delete.html'
    pk_sched_kwargs = 'eq_pk'  # Definir el nombre del parametro obtenido en la url

    def get_success_url(self):
        Proyecto = self.kwargs['pk']
        # # Creacion de un equipo
        # equipo = Equipo()
        # # Asignacion del equipo al sprint
        # equipo.sprint = Sprint.objects.get(id=self.kwargs['pk'])
        # # Persistencia del equipo
        # equipo.save()
        return reverse_lazy('sprintlist', kwargs={'pk': Proyecto})

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
        print(equ.miembros)

        return context
