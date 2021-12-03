from django.urls import path, include
from sprint.views import *

urlpatterns = [
    # Paths de views
    path('project/<int:pk>/sprint/', sprintView.as_view(), name='sprintlist'),
    path('project/<int:pk>/sprint/<int:sp_pk>/backlog', sprint_backlog_view, name='sprintbacklog'),
    path('project/<int:pk>/sprint/<int:sp_pk>', sprintView_Kanban.as_view(), name='sprintKanban'),
    path('project/<int:pk>/sprint/crear', crear_sprint.as_view(), name='sprintcreate'),
    path('project/<int:pk>/sprint/<int:sp_pk>/burndownchart/', ver_burndownchart, name='burndown_chart'),
]
