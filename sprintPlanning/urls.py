from django.urls import path, include
from sprint.views import *
from sprintPlanning.views import modificar_sprintplanni, asignarUs, planificarus, listarus, contenedor_pasos, \
    listadoparaestimar, View_USasignado

urlpatterns = [
    # Paths de views
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanningPrimerpaso/', modificar_sprintplanni, name='sprintpaso1'),
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanningTercerpaso/', asignarUs.as_view(), name='sprintpaso3'),
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanningus/', listarus, name='listarus'),
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanning/<int:us_pk>/planificarus', planificarus, name='planifius'),
    path('project/<int:pk>/sprint/<int:sp_pk>/pasossrintplanning/', contenedor_pasos, name="contenedor_pasos"),
    path('project/<int:pk>/sprint/<int:sp_pk>/listarestimacion/', View_USasignado.as_view(), name="listado"),

]