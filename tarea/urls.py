from django.urls import path,include
from tarea.views import *
urlpatterns = [
    path('project/<int:pk>/userstory/<int:us_pk>/crearTarea', crear_tarea, name='crear_tarea'),
    path('project/<int:pk>/userstory/<int:us_pk>/editarTarea/<int:tr_pk>', editar_tarea, name='editar_tarea'),
    path('project/<int:pk>/userstory/<int:us_pk>/Tareas', tareas, name='tareas'),
    path('project/<int:pk>/userstory/<int:us_pk>/historialtarea/<int:tr_pk>', historial_tarea, name='historial_tarea'),
    path('project/<int:pk>/userstory/<int:us_pk>/borrartarea/<int:tr_pk>', borrar_tarea, name='borrar_tarea'),


]