from django.urls import path,include
from us.views import *
urlpatterns = [
        # Paths de views
        path('us/',us, name='us'),
        path('us/crearUs', crear_us.as_view(), name='crear_us'),
        path('eliminarUs/<int:pk>', Us_Delete.as_view(),name='delete_us'),
        path('editarUs/<int:pk>', editUs.as_view(), name='edit_us'),
        path('detalleUs/<int:pk>', view_us, name='detalle_us'),

]