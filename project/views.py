import sys

from django.contrib import messages
from django.contrib.auth.models import Permission
from django.forms import modelform_factory, forms
from django.shortcuts import render, redirect
from django.forms import ModelForm
from django import forms
from django.shortcuts import get_object_or_404
from django.http import HttpResponse, JsonResponse
import datetime

from django.views.generic import ListView, CreateView

from miembros.models import Miembro, RolProyecto
from project.forms import CreateProyectoForm, ProyectoForm
from project.models import Proyecto
from us.models import Us
from usuario.models import Usuario


def nuevoProyecto(request, id):
    if request.method == 'POST':
        # formaProyecto = modelform_factory(Proyecto, exclude=['creator', 'active', 'fecha_inicio', 'fecha_fin'])
        # proyectoForm = formaProyecto(request.POST)
        proyectoForm = ProyectoForm(request.POST)
        if proyectoForm.is_valid():
            Pr = proyectoForm.save(commit=False)
            # Pr.creator = Usuario.objects.get(id=id)
            try:
                Pr.save()
            except ValueError as err:
                print(err.args.__str__())
                error = err.args.__str__()
                messages.error(request, error)
                return redirect('crearProyecto', id)
            # Rol de Product Owner para el proyecto
            PO = RolProyecto()
            PO.name = 'Product Owner'
            PO.project = Pr
            PO.save()

            # Rol de scrum maaster para el proyecto
            SM = RolProyecto()
            SM.name = 'Scrum Master'
            SM.project = Pr
            SM.save()

            # Rol vacío
            RV = RolProyecto()
            RV.name = ''
            RV.project = Pr
            RV.save()

            # Selección de Scrum master
            SMmiembro = Miembro()
            SMmiembro.user = Pr.creator
            SMmiembro.rol = SM
            # Asignar 0 horas de trabajo al Scrum master
            SMmiembro.horaTrabajo = 0
            # Guardar el Scrum máster
            SMmiembro.save()

            # Permisos para el Scrum Master
            for i in Permission.objects.filter(id__gt=45):
                SM.permisos.add(i)

            # Permisos para el Product Owner
            for i in Permission.objects.filter(id__gt=72):
                PO.permisos.add(i)
            return redirect('verProyectos')
        else:
            return render(request, 'nuevoProyecto.html', {'formaProyecto': proyectoForm})

    else:
        formaProyecto = ProyectoForm()
        return render(request, 'nuevoProyecto.html', {'formaProyecto': formaProyecto})


def ProyectosView(request):
    if request.user.has_perm('view_proyecto'):
        user = request.user
        pr = Proyecto.objects.all()
        print(pr)
        return render(request, 'proyectoAgregar.html', {'Proyectos': pr})
    else:
        return redirect('inicio')


class ProyectoCreate(CreateView):
    model = Proyecto
    template_name = 'crearRolProyecto.html'
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
                miembro = Miembro.objects.filter(user_id=Usuario.objects.get(id=id).id).exclude(activo=False)
                pr = []
                for elemento in miembro:
                    pr.append(Proyecto.objects.get(id=elemento.rol.project.id))
                return render(request, 'misPryectos.html', {'Proyecto': pr})
        return render(request, 'misPryectos.html')

        # miembro = Miembro.objects.get(user_id=Usuario.objects.get(id=id).id)

    except ValueError as err:
        print("exec")
        error = err.args.__str__()
        messages.error(request, error)
        return redirect('exceptMiembro')

    pr = Proyecto.objects.filter(id=Miembro.rol.project.id)
    return render(request, 'misPryectos.html', {'Proyecto': pr})


def exceptMimebro(request):
    return render(request, 'exceptMiembro.html')


def verProyecto(request, id):
    proyecto = Proyecto.objects.get(id=id)
    print(request.user.id)
    if Miembro.objects.filter(user=request.user.id):
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        user = request.user

    permisos = user.rol.list_permissions().order_by('id')

    product_backlog = Us.objects.all().filter(project_id=id, activo=True)

    context = {
        'Proyecto': proyecto,
        'ProductBacklog': product_backlog,
        'permisos': permisos,
    }
    # m = Miembro.objects.get(user=request.user)
    # is_scrum=str(m.rol)=='Scrum Master'
    # if request.method == "POST" and request.is_ajax() and is_scrum:
    #     print(is_scrum)
    #
    #     try:
    #         UStory = Us.objects.get(id=request.POST['id'])
    #         #la diferencia entre cambios de estados no mayor a 1 solo para avanzar
    #         #para retroceder no puede ser
    #         est_actual = int(UStory.estado)
    #         est_nuevo = int(request.POST['estado'])
    #
    #         if (est_nuevo - est_actual == 1 or est_nuevo - est_actual == -2) and est_actual!=4:
    #             if(est_nuevo==4 or est_nuevo==1):
    #                 UStory.set_estado(request.POST['estado'])
    #                 UStory.save()
    #         #Descomentar para hacer los cambios de estado manualmente sin las restricciones
    #         # UStory.set_estado(request.POST['estado'])
    #         # UStory.save()
    #     except KeyError:
    #         HttpResponseServerError("Malformed data!")
    #
    #     return JsonResponse({"success": True}, status=200)
    # else:
    return render(request, 'verProyecto.html', context)


def iniciarProyecto(request, id):
    if request.method == 'POST':
        ProjectStart = Proyecto.objects.get(id=id)
        ProjectStart.fecha_inicio = datetime.date.today()
        ProjectStart.estado = 'I'
        ProjectStart.save()
        return redirect('verProyecto', id=id)
    else:
        return render(request, 'confirmarInicio.html', {'Proyecto': Proyecto.objects.get(id=id)})
