from django.urls import path, include
from reportes.views import *

urlpatterns = [
    # Paths de views
    path('reportes/', reportes_view.as_view(), name='reportes'),
    path('reportes/proyectos', Proyectos_view.as_view(), name='listProject'),
    path('reportes/proyectos/<int:pk>/PrdocutBacklog/', ProductBacklog_Reporte_view.as_view(), name='listus'),
    path('reportes/Sprint/', Sprint_view.as_view(), name='listsprint'),
    path('reportes/Sprint/us', us_view.as_view(), name='listus_3'),

    path('reportes/proyectos/<int:pk>/sprint/<int:sp_pk>/backlog/', SprintBacklog_Reporte_view.as_view(), name='listsus'),

    path('reportes/proyectos/<int:pk>/us/', Us_Reporte_view.as_view(), name='us_3'),

]
