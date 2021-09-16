#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from miembros.forms import *
from miembros.views import *

from miembros import  *


urlpatterns = [
        # Paths de views
<<<<<<< HEAD
        path('crearRolProyecto/', AddRol),
=======
        path('crearRolProyecto/<int:id>', AddRol, name='agregarRolProyecto'),
>>>>>>> Correcion de botones y creacion de proyectos
        path('agregarMiembro/', addMiembro),
        path('eliminarMiembro/', borrarMiembro),
        path('verMiembro/<int:id>',  verMiembro, name= 'verotravesmiembro'),
        path('confirmarEliminado/<int:id>', confirmaDelete, name= 'eliminado'),
        path('modifProject/<int:id>',modiProject, name= 'modificar'),
        path('detalleProyecto/<int:id>', detalleproyecto, name='detalle'),
        #path('detalleProyecto/<int:id>', detalleproyecto.as_view(), name='detalle'),

]