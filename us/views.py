from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.contrib.auth.models import Group
from django.http import JsonResponse, HttpResponseRedirect
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.shortcuts import render, HttpResponse,get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.urls import reverse
from miembros.models import Miembro
from roles.mixins import *
from sprint.models import Sprint
from tarea.models import Tarea

from usuario.models import Usuario
from us.models import *
from us.forms import *
from project.models import Proyecto


# Create your views here.

@login_required(login_url='login')
def us(request, pk):
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
    us = Us.objects.filter(project=pk).exclude(activo=False)
    proj = Proyecto.objects.get(id=pk)
    user = request.user
    context = {
        'Us': us,
        'User': user,
        'Proyecto': proj,
        'permisos': permisos,
    }
    print (context)
    return render(request, 'us.html', context=context)


def product_backlog(request, pk):
    # Filtar los us por proyecto y solo los activos
    us = Us.objects.filter(project=pk).exclude(activo=False)
    proj = Proyecto.objects.get(id=pk)
    user = request.user
    context = {
        'Us': us,
        'User': user,
        'Proj': proj
    }
    print(context)
    return render(request, 'product_backlog.html', context=context)


def view_us(request, pk, us_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    us=Us.objects.get(id=us_pk)
    proj = Proyecto.objects.get(id=pk)
    horasTrabajadas = 0
    horasAsignadas = 0
    for tr in Tarea.objects.filter(ustory_id=us_pk):
        horasTrabajadas += tr.horas
    # Obtener todos los sprint del proyecto
    for sp in Sprint.objects.filter(us__id=us_pk):
        hs_us = HistorialUs.objects.filter(ustory__sprint__id=sp.id).last()
        if hs_us.storypoints is not None:
            horasAsignadas += hs_us.storypoints
    context={
        'Us':us,
        'Proyecto':proj,
        'permisos': permisos,
        'horas_asignadas': horasAsignadas,
        'horas_trabajadas': horasTrabajadas,
        'horas_restantes': horasAsignadas - horasTrabajadas,
    }

    return render(request,'detalle_us.html',context)

def detalle_us_sprimt(request, pk, sp_pk, us_pk):
    '''
        Para acceder los destalles de un US desde un sprimt
    '''
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    us=Us.objects.get(id=us_pk)
    proj = Proyecto.objects.get(id=pk)
    horasTrabajadas = 0
    for tr in Tarea.objects.filter(sprimt__id=sp_pk, ustory_id=us_pk):
        horasTrabajadas += tr.horas
    horasAsignadas = 0
    if HistorialUs.objects.filter(ustory__sprint__id=sp_pk, ustory_id=us_pk).last().storypoints is not None:
        horasAsignadas = HistorialUs.objects.filter(ustory__sprint__id=sp_pk, ustory_id=us_pk).last().storypoints
    context={
        'Us':us,
        'Proyecto':proj,
        'permisos': permisos,
        'sprimt': Sprint.objects.get(id=sp_pk),
        'horas_asignadas': horasAsignadas,
        'horas_trabajadas': horasTrabajadas,
        'horas_restantes': horasAsignadas - horasTrabajadas,
    }

    return render(request,'deta_us_sprimt.html',context)

# definicion de vista para comentarios de un User Story
def view_comentarios(request, pk, us_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')

    #Para asi saber a que Us pertenece el comentario
    us = Us.objects.get(id=us_pk)
    #Para saber a que Proyecto pertenece el comentario
    proj = Proyecto.objects.get(id=pk)
    comentarios = Comentarios.objects.filter(us_id=us_pk, activo=True)
    print(comentarios)
    context={
        'Us': us,
        'Proyecto': proj,
        'permisos': permisos,
        'comentarios':comentarios,
    }
    return render(request, 'ver_comentarios.html', context)

#definicion de vista para crear comentarios de un User Story
def crear_comentarios(request, pk, us_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    #en caso de haber completado el fomrulario y clickeado en guardar formulario
    if request.method == 'POST':
        #instanciamos el formulario con los datos cargados del metodo post de request
        FormularioComentarios = FormularioAgregarComentarios(request.POST)
        #salvamos los valores obtenidos del post
        nuevocomentario = FormularioComentarios.save(commit=False)
        #y ahora agregamos los valores que no posee el metodo post de request como:
        #ID de proyecto
        nuevocomentario.project = Proyecto.objects.get(id= pk)
        #ID de US
        nuevocomentario.us = Us.objects.get(id = us_pk)
        #ID del usuario creador del comentario
        nuevocomentario.creador = Usuario.objects.get(id = request.user.id)
        #guardamos definitamente todos los valores obtenidos
        nuevocomentario.save()
        #buscamos los comentarios que posean el id actual
        historiales = HistorialComentarios.objects.filter(comentario=nuevocomentario.id)
        #de aqui nos interesa solo el ultimo comentario hecho
        for historial in historiales:
            ultimohistorial = historial
        #asignamos al creador del comentario que es el usuario actual que posee el request
        ultimohistorial.creador = Usuario.objects.get(id=request.user.id)
        #guardamos todos los valores
        ultimohistorial.save()
        #Para asi saber a que Us pertenece el comentario
        us = Us.objects.get(id=us_pk)
        #Para saber a que Proyecto pertenece el comentario
        proj = Proyecto.objects.get(id=pk)
        #creamos el contexto que pasaremos al redirect
        context = {
            'Proyecto': proj,
            'Us': us,
            'permisos': permisos,
        }
        #nos dirigimos a la pagina anterior
        return redirect('ver_comentarios', pk=pk, us_pk=us_pk)
    #en caso de que sea la primera vez que cargue la pagina
    else:
        FormularioComentarios = FormularioAgregarComentarios(request.GET)
        context = {
            'form': FormularioComentarios,
            'Proyecto': Proyecto.objects.get(id=pk),
            'Us': Us.objects.get(id=us_pk),
            'permisos': permisos,
        }

        return render(request, 'agregar_comentarios.html', context)

def crear_us(request, pk):
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
        FormularioUserStory = crearUsForm(request.POST)
        nuevous = FormularioUserStory.save(commit=False)
        nuevous.project= Proyecto.objects.get(id= pk)
        nuevous.save()
        historiales = HistorialUs.objects.filter(ustory_id= nuevous.id)
        for his in historiales:
            ultimohistorial = his
        ultimohistorial.user = request.user
        ultimohistorial.save()
        return redirect('us', pk=pk)
    else:
        FormularioUserStory = crearUsForm(request.GET)
        # FormularioUserStory.fields["user"].queryset = Miembro.objects.filter(rol__project_id=pk)
        return render(request, 'create_us.html', {'form': FormularioUserStory, 'Proyecto': Proyecto.objects.get(pk= pk), 'permisos': permisos})

class edit_comentario(LoginRequiredMixin,UpdateView):
    model = Comentarios
    form_class = FormularioAgregarComentarios
    template_name = 'editar_comentario.html'
    pk_sched_kwargs = 'com_pk'  # Definir el nombre del parametro obtenido en la url

    def get_success_url(self):
        Proyecto = self.kwargs['pk']
        Us=self.kwargs['us_pk']
        return reverse_lazy('ver_comentarios', kwargs={'pk': Proyecto, 'us_pk': Us})

    def get_object(self, queryset=None):
        id = int(self.kwargs.get(self.pk_sched_kwargs, None))
        obj = get_object_or_404(Comentarios, pk=id)
        return obj


    def get_context_data(self, **kwargs):
        context = super(edit_comentario, self).get_context_data(**kwargs)
        context['Proyecto'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        context['Us']=Us.objects.get(id=self.kwargs['us_pk'])
        # context['Sprint'] = Sprint.objects.get(id=self.kwargs['sp_pk'])
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
            # buscamos los comentarios que posean el id actual
            historiales = HistorialComentarios.objects.filter(comentario=self.kwargs['com_pk'])
            # de aqui nos interesa solo el ultimo comentario hecho
            for historial in historiales:
                ultimohistorial = historial
            # asignamos al creador del comentario que es el usuario actual que posee el request
            ultimohistorial.creador = Usuario.objects.get(id=self.request.user.id)
            # guardamos todos los valores
            ultimohistorial.save()
            form.save()
            return HttpResponseRedirect(self.get_success_url())
        return self.render_to_response(self.get_context_data(form=form))


def Us_Delete(request, pk, us_pk):
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
        borrar = Us.objects.get(id=us_pk)
        borrar.activo = False
        borrar.save()
        historiales = HistorialUs.objects.filter(ustory_id=us_pk)
        for his in historiales:
            ultimohistorial = his
        ultimohistorial.user = request.user
        ultimohistorial.save()
        return redirect('us', pk=pk)
    else:
        return render(request, 'delete_us.html', {'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos})

def borrar_comentario(request, pk, us_pk, com_pk):
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
        borrar = Comentarios.objects.get(id=com_pk)
        borrar.activo = False
        borrar.save()
        historiales = HistorialComentarios.objects.filter(comentario=com_pk)
        for his in historiales:
            ultimohistorial = his
        ultimohistorial.creador = request.user
        ultimohistorial.save()

        return redirect('ver_comentarios', pk=pk, us_pk=us_pk)
    else:
        context = {
            'Proyecto':Proyecto.objects.get(pk=pk),
            'Us':Us.objects.get(id=us_pk),
            'Comentario':Comentarios.objects.get(id=com_pk),
            'permisos':permisos
        }
        return render(request, 'borrar_comentario.html', context)

def editUs(request, pk, us_pk):
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
        FormularioUserStory = editUsForm(request.POST)
        if FormularioUserStory.is_valid():
            nuevous = FormularioUserStory.save(commit=False)
            nuevous.project = Proyecto.objects.get(id=pk)
            anteriorus= Us.objects.get(id= us_pk)
            anteriorus.name= nuevous.name
            anteriorus.user= nuevous.user
            if nuevous.storypoints is not None:
                anteriorus.storypoints= nuevous.storypoints
            anteriorus.estado= nuevous.estado
            anteriorus.prioridad= nuevous.prioridad
            anteriorus.descripcion= nuevous.descripcion
            anteriorus.etiqueta=nuevous.etiqueta
            anteriorus.save()
            historiales= HistorialUs.objects.filter(ustory_id=us_pk)
            for his in historiales:
                ultimohistorial= his
            ultimohistorial.user= request.user
            ultimohistorial.save()
            return redirect('us', pk=pk)  # Este tiene que redirigir a proyecto
        else:
            #pro = Us.objects.get(id=us_pk)
            #FormularioUserStory = editUsForm(instance=pro)
            #FormularioUserStory.fields["user"].queryset = Miembro.objects.filter(rol__project_id=pk)
            return render(request, 'editar_us.html', {'form': FormularioUserStory, 'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos})
    else:
        pro= Us.objects.get(id=us_pk)
        FormularioUserStory = editUsForm(instance=pro)
        # FormularioUserStory.fields["user"].queryset = Miembro.objects.filter(rol__project_id=pk)
        return render(request, 'editar_us.html', {'form': FormularioUserStory, 'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos})

def verhistorialus(request, pk, us_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    historial= HistorialUs.objects.filter(ustory_id= us_pk)
    return render(request, 'historial_us.html', {'histo': historial, 'u': Us.objects.get(pk=us_pk), 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos})

def historial_comentarios(request, pk, us_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    historial = HistorialComentarios.objects.filter(us=us_pk)
    context = {
        'historial':historial,
        'permisos':permisos,
        'Proyecto':Proyecto.objects.get(id=pk),
        'u': Us.objects.get(pk=us_pk),
    }
    return render(request, 'historial_comentarios.html', context)

def crear_us_product(request, pk):
    if request.method == 'POST':
        FormularioUserStory = crearUsProductForm(request.POST)
        nuevous = FormularioUserStory.save(commit=False)
        nuevous.project= Proyecto.objects.get(id= pk)
        nuevous.save()
        historiales = HistorialUs.objects.filter(ustory_id= nuevous.id)
        for his in historiales:
            ultimohistorial = his
        ultimohistorial.user = request.user
        ultimohistorial.save()
        return redirect('product_backlog', pk=pk)
    else:
        FormularioUserStory = crearUsProductForm(request.GET)
        return render(request, 'create_usProduct.html', {'form': FormularioUserStory, 'Proj': Proyecto.objects.get(pk= pk)})

