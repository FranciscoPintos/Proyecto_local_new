#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from principalApp.views import *


urlpatterns = [
        # Paths de views
        path('principalApp/inicio', inicioview , name='inicio'),
        path('principalApp/base', baseview , name='base'),
        path('pricipalApp/calendar',calendar.as_view(),name='calendar'),
        path('pricipalApp/send_email',email.as_view(),name='email')

]
