from django.contrib import messages
from django.forms import modelform_factory
from django.http import HttpResponseRedirect
from django.shortcuts import render, HttpResponse, redirect,get_object_or_404
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, View, UpdateView
from miembros.forms import *
from miembros.models import *
from django import forms
from django.contrib.auth.models import User


# Create your views here.
def AddRol(request, pk):
    if Miembro.objects.filter(user=request.user.id):
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        user = request.user

    permisos = user.rol.list_permissions().order_by('id')
    if request.method == 'POST':
        formulario_rol = CrearRol(request.POST)
        nuevorol = formulario_rol.save(commit=False)
        nuevorol.project = Proyecto.objects.get(id=pk)
        nuevorol.save()
        formulario_rol.save_m2m()
        return redirect('verRolesProyecto', pk)  # Este tiene que redirigir a proyecto
    else:
        formulario_rol = CrearRol(request.POST)
        return render(request, 'crearRolProyecto.html', {'formaProyecto': formulario_rol,
                                                         'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos})


def addMiembro(request, id):
    # Permisos
    if Miembro.objects.filter(user=request.user.id):
        # Obtener usuario
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        user = request.user
    # Obtener permisos
    permisos = user.rol.list_permissions().order_by('id')
    proj = Proyecto.objects.get(id=id)
    if request.method == 'POST':
        FormularioProyecto = CrearMiembro(request.POST)
        nuevomiembro = FormularioProyecto.save(commit=False)
        miembros = Miembro.objects.filter(rol__project_id=id)
        # Buscar miembros ya agregados anteriormente
        for miembro in miembros:
            if miembro.user.id == nuevomiembro.user.id:
                # Cargar sus horas de trabajo
                miembro.horaTrabajo = nuevomiembro.horaTrabajo
                # Volverlo a activar
                miembro.activo = True
                # Canviar formulario a guardar
                nuevomiembro = miembro
        # Asignar un rol vacío
        nuevomiembro.rol = RolProyecto.objects.get(project_id=id, name='')
        # Guardar en la base de datos
        nuevomiembro.save()
        return redirect('miembros', id)  # Este tiene que redirigir a proyecto
    else:
        # Crear formulario
        FormularioProyecto = CrearMiembro(request.GET)
        # Traer todos los usuarios menos los que ya son miembros activos del proyecto
        FormularioProyecto.fields['user'].queryset = Usuario.objects.exclude(miembro__rol__project_id=id, miembro__activo=True)
        # Cargar al html
        return render(request, 'addMiembro.html', {'miembro': FormularioProyecto, 'Proyecto': proj, 'permisos': permisos})


def verMiembro(request, id):
    if Miembro.objects.filter(user=request.user.id):
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        user = request.user

    permisos = user.rol.list_permissions().order_by('id')
    ver = Miembro.objects.filter(rol__project_id=id, activo=True)
    proj = Proyecto.objects.get(id=id)
    user = request.user
    print(ver)
    context = {
        'ver': ver,
        'Proyecto': proj,
        'user': user,
        'permisos': permisos,
    }
    return render(request, 'verMiembros.html', context)


def verRolesProyecto(request, id):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    # recoge los roles cuyos id de la clase foranea project coinciden con el id del proyecto
    roles = RolProyecto.objects.filter(project_id=id)
    miembros = Miembro.objects.filter(rol__project_id=id)
    proj = Proyecto.objects.get(id=id)
    return render(request, 'listarRolesProyecto.html', {'roles': roles, 'Miembros': miembros, 'Proyecto': proj, 'permisos': permisos})


def confirmaDelete(request, pk, id):
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
        borrar = Miembro.objects.get(id=id)
        idProject = borrar.rol.project.id
        borrar.activo = False
        borrar.save()
        return redirect('miembros', id=idProject)
    else:
        return render(request, 'eliminarMiembro.html', {'permisos':permisos})


def borrarMiembro(request):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    if request.method == 'POST':
        FormularioProyecto = deleteMiembro(request.POST)
        print(FormularioProyecto)
        form = FormularioProyecto.fields
        return redirect('verotravesmiembro')  # Este tiene que redirigir a proyecto
    else:
        return render(request, 'eliminarMiembro.html', {'permisos': permisos})


class modiProject(UpdateView):
    # Obtener la clase Proyecto
    model = Proyecto
    # Validar mi formulario
    form_class = modificarProject
    # Agregar el html
    template_name = 'modificarProyecto.html'
    pk_sched_kwargs = 'id'  # Definir el nombre del parametro obtenido en la url

    # Deteción de error
    def get_object(self, queryset=None):
        id = int(self.kwargs.get(self.pk_sched_kwargs, None))
        obj = get_object_or_404(Proyecto, pk=id)
        return obj

    # Validación de la url
    def get_success_url(self):

        proj_id = self.kwargs['id']
        return reverse_lazy("verProyecto", kwargs={'pk': proj_id})

    def get_context_data(self, **kwargs):
        context = super(modiProject, self).get_context_data(**kwargs)
        # Obtemos el id de nuestro proyecto
        context['Proyecto'] = Proyecto.objects.get(pk=self.kwargs['id'])
        # Ver si es un miembro del proyecto
        if Miembro.objects.filter(user=self.request.user.id):
            # obtener su usuario
            user = Miembro.objects.get(rol__project_id=self.kwargs['id'], user=self.request.user.id)
        else:
            # si no es miembro se analizan los permisos de sistema
            user = self.request.user
        # obtener sus permisos
        permisos = user.rol.list_permissions().order_by('id')
        context['permisos'] = permisos
        return context

    def form_valid(self, form):
        try:
            form.save()
        except ValueError as err:
            print(err.args.__str__())
            error = err.args.__str__()
            messages.error(self.request, error)
            return self.render_to_response(self.get_context_data(form=form))
        return HttpResponseRedirect(self.get_success_url())

def detalleproyecto(request, id):

    idprojec = Proyecto.objects.get(id=id)
    FormularioProyecto = detalleprojecto(instance=idprojec)
    return render(request, 'detalleProyecto.html', {'detalle': idprojec})


class modificarRolProyecto(UpdateView):
    model = RolProyecto
    form_class = editarRolForm
    template_name = 'modificarRolProyecto.html'

    pk_sched_kwargs = 'rol_pk'  # Definir el nombre del parametro obtenido en la url

    def get_object(self, queryset=None):
        id = int(self.kwargs.get(self.pk_sched_kwargs, None))
        obj = get_object_or_404(RolProyecto, pk=id)
        return obj

    def get_success_url(self):
        proj_id = self.kwargs['pk']
        return reverse_lazy('verRolesProyecto', kwargs={'id': proj_id})

    def get_context_data(self, **kwargs):
        context = super(modificarRolProyecto, self).get_context_data(**kwargs)
        context['Proyecto'] = Proyecto.objects.get(pk=self.kwargs['pk'])
        return context


def roles_miembros(request, pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    roles = RolProyecto.objects.filter(project_id=pk)

    return render(request, 'roles_miembros.html', {'Roles': roles, 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos})


def asignar_rolProyecto(request, pk, rl_pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')

    # Obtener el rol que se desea modificar
    rol = RolProyecto.objects.get(id=rl_pk)
    # Si es un método
    if request.method == 'POST':
        # Formularios para un solo miembro
        if rol.name == 'Scrum Master' or rol.name == 'Produc Owner':
            FormularioProyecto = ListarMiembro(request.POST)
        else:
            FormularioProyecto = ListarMiembros(request.POST)
        miembros_selected = FormularioProyecto.data.getlist('miembros')
        miembros = Miembro.objects.filter(rol__project_id=pk, rol__name=rol.name)
        for m in miembros:
            m.rol = RolProyecto.objects.get(project_id=pk, name='')
            m.save()
        for m in miembros_selected:
            if m != '':
                miembro_rol = Miembro.objects.get(id=m)
                miembro_rol.rol = rol
                miembro_rol.save()

        return redirect('roles_miembros', pk=pk)

    miembros = Miembro.objects.filter(rol__project_id=pk)
    FormularioProyecto = ListarMiembros()
    if rol.name == 'Scrum Master':
        FormularioProyecto = ListarMiembro()
        FormularioProyecto.fields["miembros"].queryset = Miembro.objects.filter(rol__project_id=pk).exclude(rol__name='Product Owner')
        if len(Miembro.objects.filter(rol__name='Scrum Master', rol__project_id=pk)) > 0:
            FormularioProyecto.initial['miembros'] = Miembro.objects.get(rol__name='Scrum Master', rol__project_id=pk)

    elif rol.name == 'Product Owner':
        FormularioProyecto = ListarMiembro()
        FormularioProyecto.fields["miembros"].queryset = Miembro.objects.filter(rol__project_id=pk).exclude(rol__name='Scrum Master')
        if len(Miembro.objects.filter(rol__name='Product Owner', rol__project_id=pk)):
            FormularioProyecto.initial['miembros'] = Miembro.objects.get(rol__name='Product Owner', rol__project_id=pk)
    else:
        FormularioProyecto.fields["miembros"].queryset = Miembro.objects.filter(rol__project_id=pk).exclude(rol__name='Scrum Master').exclude(rol__name='Product Owner')
        FormularioProyecto.initial['miembros'] = Miembro.objects.filter(rol__name=rol.name)
    return render(request, 'asignar_rolProyecto.html', {'Usuarios': FormularioProyecto, 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos, 'rol': rol})
