from django.contrib import messages
from django.forms import modelform_factory
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
        FormularioProyecto = CrearRol(request.POST)
        nuevorol = FormularioProyecto.save(commit=False)
        nuevorol.project = Proyecto.objects.get(id=pk)
        nuevorol.save()
        FormularioProyecto.save_m2m()
        return redirect('verRolesProyecto', pk)  # Este tiene que redirigir a proyecto
    else:
        FormularioProyecto = CrearRol(request.POST)
        return render(request, 'crearRolProyecto.html', {'formaProyecto': FormularioProyecto, 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos})



def addMiembro(request, id):
    if Miembro.objects.filter(user=request.user.id):
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        user = request.user

    permisos = user.rol.list_permissions().order_by('id')
    proj = Proyecto.objects.get(id=id)
    if request.method == 'POST':
        FormularioProyecto = CrearMiembro(request.POST)
        nuevorol = FormularioProyecto.save(commit=False)
        nuevorol.save()
        return redirect('miembros', id)  # Este tiene que redirigir a proyecto
    else:
        FormularioProyecto = CrearMiembro(request.GET)
        FormularioProyecto.fields['user'].queryset = Usuario.objects.exclude(miembro__rol__project_id=id,
                                                                             miembro__activo=True)
        FormularioProyecto.fields["rol"].queryset = RolProyecto.objects.filter(project_id=id).exclude(name='Scrum Master')
        print(RolProyecto.objects.filter(project_id=id))
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


def confirmaDelete(request, id):
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
        borrar = Miembro.objects.get(id=id)
        idProject = borrar.rol.project.id
        borrar.activo = False
        borrar.save()
        return redirect('verotravesmiembro', id=idProject)
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


def modiProject(request, id):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    idprojec = Proyecto.objects.get(id=id)
    auxi = idprojec.creator
    if request.method == 'POST':
        FormularioProyecto = modificarProject(request.POST)
        if FormularioProyecto.is_valid():
            Pr = FormularioProyecto.save(commit=False)
            Pr.creator = auxi
            idprojec.name = Pr.name
            idprojec.fecha_inicio = Pr.fecha_inicio
            idprojec.fecha_fin = Pr.fecha_fin
            try:
                idprojec.save()
            except ValueError as err:
                print(err.args.__str__())
                error = err.args.__str__()
                messages.error(request, error)
                return redirect('modificar', id=id)
            return redirect('verProyecto', id)
        return redirect('modificar', id=id)
    else:
        idprojec = Proyecto.objects.get(id=id)
        if idprojec.estado == 'E':
            FormularioProyecto = modificarProject(instance=idprojec)
        else:
            if idprojec.estado == 'I':
                FormularioProyecto = modificarProjectIniciado(instance=idprojec)
            redirect('verProyecto', id)
        User = request.user
        proj=Proyecto.objects.get(id=id)
        return render(request, 'modificarProyecto.html', {'proyecto': FormularioProyecto, 'user': User, 'Proyecto': proj, 'permisos': permisos})


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
        context['proj'] = Proyecto.objects.get(pk=self.kwargs['pk'])
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
        # Formularios paar un solo miembro
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
            if m is not '':
                miembro_rol = Miembro.objects.get(id=m)
                miembro_rol.rol = rol
                miembro_rol.save()

        return redirect('roles_miembros', pk=pk)

    miembros = Miembro.objects.filter(rol__project_id=pk)
    FormularioProyecto = ListarMiembros()
    if rol.name == 'Scrum Master':
        FormularioProyecto = ListarMiembro()
        FormularioProyecto.fields["miembros"].queryset = Miembro.objects.filter(rol__project_id=pk).exclude(rol__name='Product Owner')
        FormularioProyecto.initial['miembros'] = Miembro.objects.filter(rol__name='Scrum Master')
    elif rol.name == 'Product Owner':
        FormularioProyecto = ListarMiembro()
        FormularioProyecto.fields["miembros"].queryset = Miembro.objects.filter(rol__project_id=pk).exclude(rol__name='Scrum Master')
        FormularioProyecto.initial['miembros'] = Miembro.objects.filter(rol__name='Product Owner')
    else:
        FormularioProyecto.fields["miembros"].queryset = Miembro.objects.filter(rol__project_id=pk).exclude(rol__name='Scrum Master').exclude(rol__name='Product Owner')
        FormularioProyecto.initial['miembros'] = Miembro.objects.filter(rol__name=rol.name)
    return render(request, 'asignar_rolProyecto.html', {'Usuarios': FormularioProyecto, 'Proyecto': Proyecto.objects.get(id=pk), 'permisos': permisos, 'rol': rol})
