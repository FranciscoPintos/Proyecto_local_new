from django.forms import modelform_factory
from django.shortcuts import render

# Create your views here.
from proyecto.models import Proyecto


def nuevoProyecto(request, id):
    formaProyecto = modelform_factory(Proyecto, exclude=['creator', 'active'])
    return render(request, 'nuevoProyecto.html', {'formaProyecto': formaProyecto, 'id': id})
