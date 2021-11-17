from django.urls import path,include
from us.views import *


urlpatterns = [
        # Paths de views
        path('project/<int:pk>/us/',us, name='us'),
        path('project/<int:pk>/productBacklog/', product_backlog, name='product_backlog'),
        path('project/<int:pk>/crear_us/', crear_us, name='crear_us'),
        path('project/<int:pk>/crear_usProduct/', crear_us_product, name='crear_us_product'),
        path('project/<int:pk>/editarUs/<int:us_pk>', editUs, name='edit_us'),
        path('project/<int:pk>/eliminarUs/<int:us_pk>', Us_Delete,name='delete_us'),
        path('project/<int:pk>/detalleUs/<int:us_pk>', view_us, name='detalle_us'),
        path('project/<int:pk>/sprimt/<int:sp_pk>/detalleUsSprimt/<int:us_pk>', detalle_us_sprimt, name='detalle_us_sprimt'),
        path('project/<int:pk>/detalleUs/<int:us_pk>/editar_comentario/<int:com_pk>', edit_comentario.as_view(), name='editar_comentario'),
        path('project/<int:pk>/verhistorialus/<int:us_pk>', verhistorialus, name='histo'),
        path('project/<int:pk>/verComentarios/<int:us_pk>', view_comentarios, name='ver_comentarios'),
        path('project/<int:pk>/CrearComentarios/<int:us_pk>', crear_comentarios, name='crear_comentarios'),
        path('project/<int:pk>/us/<int:us_pk>/borrar_comentario/<int:com_pk>', borrar_comentario, name='borrar_comentario'),
        path('project/<int:pk>/us/<int:us_pk>/historial_comentarios/', historial_comentarios, name='historial_comentarios'),

]
