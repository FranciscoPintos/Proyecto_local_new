# Librerías para views

from django.urls import path, include
from django.views.generic import TemplateView
from etiqueta.views import *

urlpatterns = [
        # Paths de views
        path('project/<int:pk>/crearEtiqueta', crear_etiqueta, name='crear_etiqueta'),
        path('project/<int:pk>/Etiquetas', ver_etiquetas, name='ver_etiquetas'),


]
