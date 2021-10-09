from django.urls import path, include
from sprint.views import *
from sprintPlanning.views import modificar_sprintplanni

urlpatterns = [
    # Paths de views
    path('project/<int:pk>/sprint/<int:sp_pk>/sprintplanningPrimerpaso/', modificar_sprintplanni, name='sprintpaso1'),
    ]