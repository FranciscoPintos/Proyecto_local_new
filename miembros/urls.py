#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from miembros.forms import *
from miembros.views import *

from miembros import  *


urlpatterns = [
        # Paths de views
        path('project/<int:pk>/crearRolProyecto', AddRol, name='agregarRolProyecto'),
        path('project/<int:id>/agregarMiembro', addMiembro, name='agregarMiembro'),
        path('project/<int:pk>/eliminarMiembro', borrarMiembro),
        path('project/<int:id>/miembros',  verMiembro, name= 'miembros'),
        path('project/<int:pk>/confirmarEliminado/<int:id>', confirmaDelete, name= 'eliminado'),
        path('project/<int:id>/modificar',modiProject, name= 'modificar'),
        path('project/<int:id>/detalleProyecto', detalleproyecto, name='detalle'),
        path('project/<int:id>/listarRolesProyecto', verRolesProyecto, name='verRolesProyecto'),
        path('project/<int:pk>/modificarRolProyecto/<int:rol_pk>', modificarRolProyecto.as_view(), name='modificarRolProyecto'),
        path('project/<int:pk>/rolesMiembros', roles_miembros, name="roles_miembros"),
        path('project/<int:pk>/asignarRol/<int:rl_pk>', asignar_rolProyecto, name="asignar_rolProyecto"),

]
