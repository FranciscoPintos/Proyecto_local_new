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

from usuario.models import Usuario
from us.models import *
from us.forms import *
from project.models import Proyecto


# Create your views here.

@login_required(login_url='login')
def us(request,pk):
    us=Us.objects.filter(project=pk).exclude(activo=False) #Filtar los us por proyecto
   # us = Us.objects.all() # Todos los us creados
    proj=Proyecto.objects.get(id=pk)
    user=request.user
    context={
        'Us':us,
        'User':user,
        'Proj':proj
    }
    print (context)
    return render(request,'us.html',context=context)

def view_us(request,pk,us_pk):
    us=Us.objects.get(id=us_pk)
    proj = Proyecto.objects.get(id=pk)
    context={
        'Us':us,
        'Proj':proj
    }

    return render(request,'detalle_us.html',context)


def crear_us(request, pk):
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
        FormularioUserStory.fields["user"].queryset = Miembro.objects.filter(rol__project_id=pk)
        return render(request, 'create_us.html', {'form': FormularioUserStory, 'Proj': Proyecto.objects.get(pk= pk)})


def Us_Delete(request, pk, us_pk):
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
        return render(request, 'delete_us.html', {'Proj': Proyecto.objects.get(pk=pk)})

def editUs(request, pk, us_pk):
    if request.method == 'POST':
        FormularioUserStory = editUsForm(request.POST)
        if FormularioUserStory.is_valid():
            nuevous = FormularioUserStory.save(commit=False)
            nuevous.project = Proyecto.objects.get(id=pk)
            anteriorus= Us.objects.get(id= us_pk)
            anteriorus.name= nuevous.name
            anteriorus.user= nuevous.user
            anteriorus.storypoints= nuevous.storypoints
            anteriorus.estado= nuevous.estado
            anteriorus.prioridad= nuevous.prioridad
            anteriorus.descripcion= anteriorus.descripcion
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
            return render(request, 'editar_us.html', {'form': FormularioUserStory, 'Proj': Proyecto.objects.get(pk=pk)})
    else:
        pro= Us.objects.get(id=us_pk)
        FormularioUserStory = editUsForm(instance=pro)
        FormularioUserStory.fields["user"].queryset = Miembro.objects.filter(rol__project_id=pk)
        return render(request, 'editar_us.html', {'form': FormularioUserStory, 'Proj': Proyecto.objects.get(pk=pk)})
def verhistorialus(request, pk, us_pk):
    historial= HistorialUs.objects.filter(ustory_id= us_pk)
    return render(request, 'historial_us.html', {'histo': historial, 'u': Us.objects.get(pk=us_pk), 'Proj': Proyecto.objects.get(id=pk)})