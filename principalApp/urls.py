#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from principalApp.views import *


urlpatterns = [
        # Paths de views
        path('principalApp/inicio', inicioview.as_view() , name='inicio'),
        path('principalApp/base', baseview.as_view() , name='base'),

]
