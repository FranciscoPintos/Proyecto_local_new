#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from principalApp import  views


urlpatterns = [
        # Paths de views
        path('principalApp/inicio', TemplateView.as_view(template_name="inicio.html"),name='inicio'),



]