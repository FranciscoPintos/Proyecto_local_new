#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from project.views import nuevoProyecto

urlpatterns = [
        # Paths de views
        path('proyecto/nuevoProyecto/<int:id>', nuevoProyecto),


]