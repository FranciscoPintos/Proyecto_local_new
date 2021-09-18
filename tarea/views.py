from django.shortcuts import render, redirect

# Create your views here.
from project.models import Proyecto
from tarea.forms import *
from tarea.models import HistorialTarea
from us.models import Us


def crear_tarea(request, pk, us_pk):
    if request.method == 'POST':
        FormularioUserStory = crearTarea(request.POST)
        nuevous = FormularioUserStory.save(commit=False)
        nuevous.ustory= Us.objects.get(id= us_pk)
        nuevous.save()
        return redirect('tareas', pk=pk, us_pk=us_pk)
    else:
        FormularioUserStory = crearTarea(request.GET)
        return render(request, 'crear_tarea.html', {'form': FormularioUserStory, 'Proj': Proyecto.objects.get(pk= pk), 'Us': Us.objects.get(pk= us_pk)})

def editar_tarea(request, pk, us_pk, tr_pk):
        if request.method == 'POST':
            FormularioUserStory = editarTarea(request.POST)
            nuevous = FormularioUserStory.save(commit=False)
            nuevous.ustory = Us.objects.get(id=us_pk)
            anteriotarea= Tarea.objects.get(id= tr_pk)
            anteriotarea.descripcion= nuevous.descripcion
            anteriotarea.horas= nuevous.horas
            anteriotarea.save()
            return redirect('tareas', pk=pk, us_pk=us_pk)
        else:
            FormularioUserStory = crearTarea(instance= Tarea.objects.get(id= tr_pk))
            return render(request, 'editar_tarea.html',
                          {'form': FormularioUserStory, 'Proj': Proyecto.objects.get(pk=pk),
                           'Us': Us.objects.get(pk=us_pk)})

def tareas(request, pk, us_pk):
    tr=Tarea.objects.filter(ustory__id=us_pk) #Filtar los us por proyecto
    proj=Proyecto.objects.get(id=pk)
    us= Us.objects.get(id=us_pk)
    user=request.user
    context={
        'Us':us,
        'User':user,
        'Proj':proj,
        'Tr': tr
    }
    print (context)
    return render(request,'tareas.html',context=context)
def historial_tarea(request, pk, us_pk, tr_pk):

    historial= HistorialTarea.objects.filter(tarea_id= tr_pk)
    return render(request, 'historial_tarea.html', {'histo': historial, 'u': Us.objects.get(pk=us_pk), 'Proj': Proyecto.objects.get(id=pk)})
def borrar_tarea(request, pk, us_pk, tr_pk):
     if request.method == 'POST':
            nuevous = Tarea.objects.get(id=tr_pk).delete()
            return redirect('tareas', pk=pk, us_pk=us_pk)
     else:
            return render(request, 'borrar_tarea.html', {'Proj': Proyecto.objects.get(pk= pk),
                                                        'Us': Us.objects.get(pk= us_pk)})