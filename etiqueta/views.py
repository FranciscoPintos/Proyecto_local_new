from django.contrib import messages
from django.shortcuts import render, redirect
from etiqueta.forms import CrearEtiqueta, editEtiquetaForm
from etiqueta.models import Etiqueta
from miembros.models import Miembro
from project.models import Proyecto


def crear_etiqueta(request, pk):
    """
    Funcion para crear una Etiqueta en base a un formulario

    :param request: Objeto request de las peticiones html

    :param pk: Id del número de proyecto

    :return: html + contexto[formulario y permisos]
    """
    # Obtener el Proyecto en base al id
    proyecto = Proyecto.objects.get(id=pk)
    # Si un usuario es miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # Obtener el miembro
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        user = request.user

    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')

    # Contexto a pasar al html
    context = {
        'Proyecto': proyecto,
        # Permisos a validar en el html
        'permisos': permisos,
    }
    # Si se recibe informacion del html por el método post
    if request.method == 'POST':
        # Obtener formulario de etiqueta
        formNewEtiqueta = CrearEtiqueta(request.POST)

        # Validar formulario
        if formNewEtiqueta.is_valid():
            # Obtener modelo del formulario
            modelEtiqueta = formNewEtiqueta.save(commit=False)
            # Asignar el usuario al modelo
            modelEtiqueta.user = request.user
            # Asignar proyecto a la etiqueta
            modelEtiqueta.proyecto = Proyecto.objects.get(id=pk)
            # Peristir el modelo en la base de datos
            modelEtiqueta.save()
            # Volvemos al litado de etiquetas
            return redirect('ver_etiquetas', pk=pk)

        # Agregamos el formulario al contexto
        context['form'] = formNewEtiqueta
        # Si el formulario no es válido volvemos a enviar el contexto
        return render(request, 'crear_etiqueta.html', context)

    # Si no es un método POST
    else:

        # Creamos un formulario vacío
        formNewEtiqueta = CrearEtiqueta()
        # Agregamos el formulario al contexto
        context['form'] = formNewEtiqueta
        # Enviamos el contexto al html
        return render(request, 'crear_etiqueta.html', context)

def ver_etiquetas(request, pk):
    # Obtener el Proyecto en base al id
    proyecto = Proyecto.objects.get(id=pk)
    # Si un usuario es miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # Obtener el miembro
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        user = request.user

    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')

    try:
        c = 0
        etiqueta = Etiqueta.objects.all().filter(proyecto_id=pk).exclude(activo=False)
        return render(request, 'ver_etiquetas.html', {'Proyecto': Proyecto.objects.get(id=pk), 'Etiqueta': etiqueta, 'permisos': permisos })
    except ValueError as err:
        print("exec")
        error = err.args.__str__()
        messages.error(request, error)
        return redirect('exceptMiembro')


def edit_etiqueta(request, pk, et_pk):
    # Obtener el Proyecto en base al id
    proyecto = Proyecto.objects.get(id=pk)
    # Si un usuario es miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # Obtener el miembro
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        user = request.user

    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    if request.method == 'POST':
        FormularioEtiqueta = editEtiquetaForm(request.POST)
        if FormularioEtiqueta.is_valid():
            nuevous = FormularioEtiqueta.save(commit=False)
            nuevous.proyecto = Proyecto.objects.get(id=pk)
            anteriorus= Etiqueta.objects.get(id=et_pk)
            anteriorus.name = nuevous.name
            anteriorus.save()
            return redirect('ver_etiquetas', pk=pk)
        else:
            return render(request, 'editar_etiqueta.html', {'form': FormularioEtiqueta, 'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos})
    else:
        etiqueta = Etiqueta.objects.get(id=et_pk)
        FormularioEtiqueta = editEtiquetaForm(instance=etiqueta)
        return render(request, 'editar_etiqueta.html', {'form': FormularioEtiqueta, 'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos})


def delete_etiqueta(request, pk, et_pk):

    # Obtener el Proyecto en base al id
    proyecto = Proyecto.objects.get(id=pk)
    # Si un usuario es miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # Obtener el miembro
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        user = request.user

    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    if request.method == 'POST':
        borrar = Etiqueta.objects.get(id=et_pk)
        borrar.activo = False
        borrar.save()
        return redirect('ver_etiquetas', pk=pk)
    else:
        return render(request, 'delete_etiqueta.html', {'Proyecto': Proyecto.objects.get(pk=pk), 'permisos': permisos})
