from django.urls import path, include
from sprint.views import *
from sprintPlanning.views import modificar_sprintplanni, asignarUs, planificarus, listarus

urlpatterns = [
    # Paths de views
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanningPrimerpaso/', modificar_sprintplanni, name='sprintpaso1'),
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanningTercerpaso/', asignarUs.as_view(), name='sprintpaso3'),
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanningus/', listarus, name='listarus'),
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanning/<int:us_pk>/planificarus', planificarus, name='planifius'),
    ]