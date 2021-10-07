from django.shortcuts import render

from miembros.models import Miembro
from project.models import Proyecto
from sprint.models import Sprint


def crearEquipo(request, Proyecto_pk, Sprint_pk):
    proyecto = Proyecto.objects.get(id=Proyecto_pk)
    sprint = Sprint.objects.get(id=Sprint_pk)
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=id, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
