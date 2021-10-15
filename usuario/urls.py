#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from usuario.views import *

urlpatterns = [
        # Paths de views
        path('usuario/ver', verUsuario),
        path('list/',UserListView.as_view(),name='user_list'),

        path('usuario/<int:id>', verUsuario,name='perfil'),


]
