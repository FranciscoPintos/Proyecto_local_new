#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from project.views import *
#from project.forms import *

urlpatterns = [
        # Paths de views
        path('project/nuevoProyecto/<int:id>', nuevoProyecto, name='crearProyecto'),
        path('project/listarProyectos', ProyectosView.as_view()),
        #path('project/crearProyecto' , crearProyecto.as_view())


]
