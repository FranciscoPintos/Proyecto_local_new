from django.urls import path,include
from us.views import *
urlpatterns = [
        # Paths de views
        path('project/<int:pk>/us/',us, name='us'),
        path('project/<int:pk>/crear_us/', crear_us, name='crear_us'),
        path('project/<int:pk>/editarUs/<int:us_pk>', editUs, name='edit_us'),
        path('project/<int:pk>/eliminarUs/<int:us_pk>', Us_Delete,name='delete_us'),
        path('project/<int:pk>/detalleUs/<int:us_pk>', view_us, name='detalle_us'),
        path('project/<int:pk>/verhistorialus/<int:us_pk>', verhistorialus, name='histo'),

]