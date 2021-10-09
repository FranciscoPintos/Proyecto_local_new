from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib.auth.models import Group
from django.http import JsonResponse, HttpResponseRedirect, request
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.shortcuts import render, HttpResponse, get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.urls import reverse

from roles.mixins import *

from sprint.models import *
from project.models import *
from sprint.forms import *
from miembros.models import *

class sprintView(ListView):
    model=Sprint
    template_name='sprint_view.html'

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
        context['permisos'] = permisos

        print(context)
        return context





class sprintView_Kanban(ListView):
    model=Sprint
    template_name='sprint_kanban.html'

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
        context['permisos'] = permisos
        context['sprint']=Sprint.objects.get(pk=self.kwargs['sp_pk'])
        return context



class crear_sprint(LoginRequiredMixin, CreateView):
    permission_required = 'add_sprint'
    model = Sprint
    form_class = crearSprintForm
    template_name = 'create_sprint.html'

    def get_success_url(self):
        Proyecto= self.kwargs['pk']
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
    # def post(self, request, *args, **kwargs):
    #     self.object=self.get_object
    #     form = self.form_class(request.POST)
    #     if form.is_valid():
    #         data=form.save(commit=False)
    #         # print('dfgdfgd',data.project)
    #         data.proyecto=Proyecto.objects.get(pk=self.kwargs['pk'])
    #         # data.estado=Us.status[0][0]
    #         data.save()
    #         return HttpResponseRedirect(self.get_success_url())
    #     return self.render_to_response(self.get_context_data(form=form))



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

