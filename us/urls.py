from django.urls import path,include
from us.views import *
urlpatterns = [
        # Paths de views
        path('project/<int:pk>/us/',us, name='us'),
        path('project/<int:pk>/crear_us/', crear_us.as_view(), name='crear_us'),
        path('project/<int:pk>/editarUs/<int:us_pk>', editUs.as_view(), name='edit_us'),
        path('project/<int:pk>/eliminarUs/<int:us_pk>', Us_Delete.as_view(),name='delete_us'),
        path('detalleUs/<int:pk>', view_us, name='detalle_us'),

]