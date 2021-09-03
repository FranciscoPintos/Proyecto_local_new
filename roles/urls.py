#librerías para views

from django.urls import path,include
from roles.views import *


urlpatterns = [
        # Paths de views
        path('rol/base/', base_roles, name='base_roles'),
        path('rol/',roles,name='roles'),
        path('rol/creado',creado.as_view(),name='creado'),
        path('crearRoles/', crear_rol.as_view(), name='crear_rol'),
        path('eliminarRol/<int:pk>', RolDelete.as_view(),name='delete_rol'),
        path('editarRol/<int:pk>', editRol.as_view(),name='edit_rol'),
        path('asignarRol/<int:id>', asignarRol, name='asignar_rol'),
        path('listarUsuarios/', listarUsuarios, name="listar_usuarios"),

]

#96128541178-8hkdejl0g62hiurv8a71ah99uvls9up6.apps.googleusercontent.com
#HZaQQ9N-W__8oaltWtQ_xquG