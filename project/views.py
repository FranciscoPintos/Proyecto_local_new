import sys

from django.contrib import messages
from django.forms import modelform_factory, forms
from django.shortcuts import render, redirect
from django.forms import ModelForm
from django import forms
from django.shortcuts import get_object_or_404

# Create your views here.
from django.views.generic import ListView, CreateView

from project.forms import CreateProyectoForm, ProyectoForm
from project.models import Proyecto
from usuario.models import Usuario


def nuevoProyecto(request, id):
    if  request.method == 'POST':
        #formaProyecto = modelform_factory(Proyecto, exclude=['creator', 'active', 'fecha_inicio', 'fecha_fin'])
        #proyectoForm = formaProyecto(request.POST)
        proyectoForm = ProyectoForm(request.POST)
        if proyectoForm.is_valid():
            Pr = proyectoForm.save(commit=False)
            Pr.creator = Usuario.objects.get(id=id)
            try:
                Pr.save()
            except ValueError as err:
                print (err.args.__str__())
                error = err.args.__str__()
                messages.error(request,error)
                return redirect('crearProyecto',id)

            return redirect('inicio')
        else:
            return render(request, 'nuevoProyecto.html', {'formaProyecto': proyectoForm})

    else:
        #formaProyecto = modelform_factory(Proyecto, exclude=['creator', 'active','fecha_inicio','fecha_fin'])
        formaProyecto = ProyectoForm(request.POST)
        return render(request, 'nuevoProyecto.html', {'formaProyecto': formaProyecto})

class ProyectosView(ListView):
    model = Proyecto
    templat_name = 'project/nuevoProyecto.html'

class ProyectoCreate(CreateView):
    model = Proyecto
    template_name = 'proyecto/crearRolProyecto.html'
    form_class = CreateProyectoForm
    def get_context_data(self, **kwargs):
        context = super(ProyectoCreate, self).get_context_data(**kwargs)
        if 'form' not in context:
            context['form'] = self.form_class(self.request.GET)

        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object
        form = self.form_class(request.POST)

def verProyectos(request, id):
    print(Usuario.objects.get(id=id).id)
    user = request.user

    try:
        c = 0
        for miembros in Miembro.objects.all():
            print(miembros.user)
            if miembros.user.id == id:
                miembro = Miembro.objects.filter(user_id=Usuario.objects.get(id=id).id)
                for elemento in miembro:
                    pr = Proyecto.objects.filter(id=elemento.rol.project.id)
                    return render(request, 'misPryectos.html', {'Proyecto': pr, 'modificar':user.has_perm("change_proyecto")})
        return redirect('exceptMiembro')

        # miembro = Miembro.objects.get(user_id=Usuario.objects.get(id=id).id)
        print(id)
    except ValueError as err:
        print("exec")
        error = err.args.__str__()
        messages.error(request, error)
        return redirect('exceptMiembro')

    print(miembro.rol.project.id)
    pr = Proyecto.objects.filter(id=miembro.rol.project.id)
    return render(request, 'misPryectos.html',{'Proyecto':pr})


def exceptMimebro(request):
    return render(request, 'exceptMiembro.html')


def verProyecto(request, id):
    proyecto = Proyecto.objects.get(id=id)

    user = request.user

    iniciar_proyecto = user.has_perm('change_proyecto')
    modificar_proyecto = user.has_perm('change_proyecto')
    agregar_mimebro = user.has_perm('add_miembro')
    listar_miembro = user.has_perm('view_mimebro')
    crear_rol_proyecto = user.has_perm('add_rolproyecto')
    cambiar_estado = user.has_perm('change_proyecto')

    context = {
        'Proyecto': proyecto,
        'iniciar_proyecto': iniciar_proyecto,
        'modificar_proyecto': modificar_proyecto,
        'agregar_mimebro': agregar_mimebro,
        'listar_miembro': listar_miembro,
        'crear_rol_proyecto': crear_rol_proyecto,
        'cambiar_estado': cambiar_estado,
    }

    return render(request, 'verProyecto.html', context)
