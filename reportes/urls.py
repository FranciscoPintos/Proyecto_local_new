from django.urls import path, include
from reportes.views import *

urlpatterns = [
    # Paths de views
    path('reportes/', reportes_view.as_view(), name='reportes'),
    path('reportes/proyectos', Proyectos_view.as_view(), name='listProject'),
    path('reportes/proyectos/<int:pk>/PrdocutBacklog/', ProductBacklog_Reporte_view.as_view(), name='listus'),
    path('reportes/Sprint/', Sprint_view.as_view(), name='listsprint'),

]
