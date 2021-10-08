from django.shortcuts import render

from miembros.models import Miembro
from sprint.models import Sprint


def crear_sprintplanni(request, pk):
    # Ver si es un miembro del proyecto
    if Miembro.objects.filter(user=request.user.id):
        # obtener su usuario
        user = Miembro.objects.get(rol__project_id=pk, user=request.user.id)
    else:
        # si no es miembro se analizan los permisos de sistema
        user = request.user
    # obtener sus permisos
    permisos = user.rol.list_permissions().order_by('id')
    listaSprint=Sprint.objects.filter(proyecto_id=pk).exclude(estado=2).exclude(estado=3)


