#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView
from principalApp.views import crearProyecto

from principalApp import  *


urlpatterns = [
        # Paths de views
        path('principalApp/inicio', TemplateView.as_view(template_name="inicio.html"),name='inicio'),
        path('principalApp/base', TemplateView.as_view(template_name="base.html"), name='base'),
        path('principalApp/crearProyecto', crearProyecto),


]
