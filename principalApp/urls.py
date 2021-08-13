#librerías para views

from django.urls import path,include
from principalApp import  views

urlpatterns = [
        # Paths de views
        path('principalApp/', views.inico, name='inicio'),



]