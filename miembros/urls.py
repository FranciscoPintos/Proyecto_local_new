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
<<<<<<< HEAD
>>>>>>> Correcion de botones y creacion de proyectos
        path('agregarMiembro/', addMiembro),
=======
        path('agregarMiembro/<int:id>', addMiembro, name='agregarMiembro'),
>>>>>>> Botones de proyectos redirecionado
        path('eliminarMiembro/', borrarMiembro),
        path('verMiembro/<int:id>',  verMiembro, name= 'verotravesmiembro'),
        path('confirmarEliminado/<int:id>', confirmaDelete, name= 'eliminado'),
        path('modifProject/<int:id>',modiProject, name= 'modificar'),
        path('detalleProyecto/<int:id>', detalleproyecto, name='detalle'),
<<<<<<< HEAD
        #path('detalleProyecto/<int:id>', detalleproyecto.as_view(), name='detalle'),
=======
        path('listarRolesProyecto/<int:id>', verRolesProyecto, name='verRolesProyecto'),
        path('modificarRolProyecto/<int:id>', modificarRolProyecto, name='modificarRolProyecto'),
>>>>>>> Botones de proyectos redirecionado

]