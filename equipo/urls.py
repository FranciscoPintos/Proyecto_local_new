from django.urls import path

from equipo.views import crearEquipo

urlpatterns = [
    # Paths de views
    # Vista para crear y modificar un equipo
    path('project/<int:pk>/sprint/<int:sp_pk>/equipo', crearEquipo, name='agregarRolProyecto'),
]
