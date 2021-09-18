#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from miembros.forms import *
from miembros.views import *

from miembros import  *


urlpatterns = [
        # Paths de views
        path('crearRolProyecto/<int:id>', AddRol, name='agregarRolProyecto'),
        path('project/<int:id>/agregarMiembro', addMiembro, name='agregarMiembro'),
        path('eliminarMiembro/', borrarMiembro),
        path('project/<int:id>/miembros',  verMiembro, name= 'miembros'),
        path('confirmarEliminado/<int:id>', confirmaDelete, name= 'eliminado'),
        path('project/<int:id>/modificar',modiProject, name= 'modificar'),
        path('detalleProyecto/<int:id>', detalleproyecto, name='detalle'),
        path('project/<int:id>/listarRolesProyecto', verRolesProyecto, name='verRolesProyecto'),
        path('project/<int:pk>/modificarRolProyecto/<int:rol_pk>', modificarRolProyecto.as_view(), name='modificarRolProyecto'),


]
