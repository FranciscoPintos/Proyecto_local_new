#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from usuario.views import verUsuario


urlpatterns = [
        # Paths de views
        path('usuario/ver', verUsuario),


]
