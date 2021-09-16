#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from miembros.forms import *
from miembros.views import *

from miembros import  *


urlpatterns = [
        # Paths de views
        path('crearRolProyecto/<int:id>', AddRol, name='agregarRolProyecto'),
        path('agregarMiembro/', addMiembro),
        path('eliminarMiembro/', borrarMiembro),
        path('verMiembro/<int:id>',  verMiembro, name= 'verotravesmiembro'),
        path('confirmarEliminado/<int:id>', confirmaDelete, name= 'eliminado'),
        path('modifProject/<int:id>',modiProject, name= 'modificar'),
        path('detalleProyecto/<int:id>', detalleproyecto, name='detalle'),
        path('listarRolesProyecto/<int:id>', verRolesProyecto, name='verRolesProyecto'),
        #path('detalleProyecto/<int:id>', detalleproyecto.as_view(), name='detalle'),


]
