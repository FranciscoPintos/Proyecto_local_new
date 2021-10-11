from django.urls import path

from equipo.views import *

urlpatterns = [
    # Paths de views
    # Vista para crear y modificar un equipo
    path('project/<int:pk>/sprint/<int:sp_pk>/equipo/crear', crear_equipo.as_view(), name='create_equipo'),
    path('project/<int:pk>/sprint/<int:sp_pk>/equipo/listar', equipoView.as_view(), name='listar_equipo'),
    path('project/<int:pk>/sprint/<int:sp_pk>/equipo/<int:eq_pk>', delete_equipo.as_view(), name='delete_equipo'),



]
