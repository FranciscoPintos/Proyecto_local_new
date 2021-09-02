from django.forms import modelform_factory
from django.shortcuts import render, redirect

# Create your views here.
from project.models import Proyecto
from usuario.models import Usuario

formaProyecto = modelform_factory(Proyecto, exclude=['creator', 'active', 'fecha_fin', 'fecha_inicio'])
def nuevoProyecto(request, id):
    if request.method == 'POST':
        FormularioProyecto = formaProyecto(request.POST)
        Modelo = FormularioProyecto.save(commit=False) #guardar
        Modelo.creator = Usuario.objects.get(id=id) #obtener el usuario dado su id
        Modelo.save()
        return redirect('inicio')
    else:
        return render(request, 'nuevoProyecto.html', {'formaProyecto': formaProyecto, 'id': id})