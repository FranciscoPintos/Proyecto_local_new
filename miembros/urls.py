#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from miembros.forms import detalleprojecto
from miembros.views import *

from miembros import  *


urlpatterns = [
        # Paths de views
        path('crearRolProyecto/', AddRol),
        path('agregarMiembro/', addMiembro),
        path('eliminarMiembro/', borrarMiembro),
        path('verMiembro/<int:id>',  verMiembro, name= 'verotravesmiembro'),
        path('confirmarEliminado/<int:id>', confirmaDelete, name= 'eliminado'),
        path('modifProject/<int:id>',modiProject, name= 'modificar'),
        path('detalleProyecto/<int:id>', detalleproyecto, name='detalle'),
        #path('detalleProyecto/<int:id>', detalleproyecto.as_view(), name='detalle'),


]