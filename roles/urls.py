#librerías para views

from django.urls import path,include
from roles.views import *


urlpatterns = [
        # Paths de views
        path('rol/',roles),
        path('crearRoles/', crear_rol.as_view(), name='crear_rol'),
        path('creado', creado.as_view(), name='creado'),

]

#96128541178-8hkdejl0g62hiurv8a71ah99uvls9up6.apps.googleusercontent.com
#HZaQQ9N-W__8oaltWtQ_xquG