#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from project.views import *
#from project.forms import *

urlpatterns = [
        # Paths de views
        path('project/nuevoProyecto/<int:id>', nuevoProyecto, name='crearProyecto'),
        path('project/listarProyectos/', ProyectosView, name='verProyectos' ),
        path('project/misProyectos/<int:id>', verProyectos, name='misproyectos'),
        path('project/exceptMiembro', exceptMimebro, name="exceptMiembro"),
        path('project/iniciar/<int:id>' , iniciarProyecto, name='iniciarProyecto'),

        # path('project/<int:id>/verProyecto', verProyecto, name='verProyecto'),
        path('project/<int:pk>/verProyecto', Proyect_view.as_view(), name='verProyecto'),



]
