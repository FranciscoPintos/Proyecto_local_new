from django.contrib import messages
from django.shortcuts import render, redirect
from etiqueta.forms import CrearEtiqueta
from etiqueta.models import Etiqueta
from miembros.models import Miembro
from project.models import Proyecto
from usuario.models import Usuario


def crear_etiqueta(request, pk):
    """
    Funcion para crear una Etiqueta en base a un formulario

    :param request: Objeto request de las peticiones html

    :param pr_pk: Id del número de proyecto

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

    # Ver si tiene permiso de cambiar proyecto para dar inicio a uno
    iniciar_proyecto = user.has_perm('change_proyecto')
    # Ver si tiene permiso de cambiar proyecto para dar modifiar fechas de Inicio y fin
    modificar_proyecto = user.has_perm('change_proyecto')
    # Ver si tiene permiso para agregar miembros
    agregar_miembro = user.has_perm('add_miembro')
    # Ver si tiene permiso para ver miembros
    listar_miembro = user.has_perm('view_miembro')
    # Ver si tiene permiso para agregar roles de proyecto
    crear_rol_proyecto = user.has_perm('add_rolproyecto')
    # Ver si tiene permiso para cambiar roles de proyecto
    modificar_rolproyecto = user.has_perm('change_rolproyecto')
    # Ver si tiene permiso para cambiar el estado del proyecto
    cambiar_estado = user.has_perm('change_proyecto')

    # Contexto a pasar al html
    context = {
        'Proyecto': proyecto,
        # Permisos a validar en el html
        'iniciar_proyecto': iniciar_proyecto,
        'modificar_proyecto': modificar_proyecto,
        'agregar_miembro': agregar_miembro,
        'listar_miembro': listar_miembro,
        'crear_rol_proyecto': crear_rol_proyecto,
        'cambiar_estado': cambiar_estado,
        'modificar_rolproyecto': modificar_rolproyecto,
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
            # Peristir el modelo en la base de datos
            modelEtiqueta.save()

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
    user = request.user

    try:
        c = 0
        etiqueta = Etiqueta.objects.all().filter(proyecto_id=pk).exclude(activo=False)
        return render(request, 'ver_etiquetas.html', {'Proyecto': Proyecto.objects.get(id=pk), 'Etiqueta': etiqueta })
    except ValueError as err:
        print("exec")
        error = err.args.__str__()
        messages.error(request, error)
        return redirect('exceptMiembro')

