from django.shortcuts import render

from miembros.models import Miembro
from project.models import Proyecto
from sprint.models import Sprint


def crearEquipo(request, pk, sp_pk):
    """
    Vista basa en función para la creación de un Equipo que conforma un sprint asignando miembros al equipo
    :param request:
    :param pk:
    :param sp_pk:
    :return:
    """
    # Proyecto al que pertenece
    proyecto = Proyecto.objects.get(id=pk)
    # Sprint para el cual se crea el equipo
    sprint = Sprint.objects.get(id=sp_pk)
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')

