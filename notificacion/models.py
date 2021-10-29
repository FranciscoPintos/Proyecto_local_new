from django.db import models
# necesario para ajustar la fecha y hora actual de la notifiacion
from django.utils.timezone import now
# importacion de los modelos de usuario
from usuario.models import Usuario


# clase que representa a la tabla Notificacion dentro de la base de datos
class Notificacion(models.Model):
    # clave foranea de id de usuario
    user = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    # campo de descripcion de la notificacion
    descripcion = models.CharField(max_length=2000)
    # campo de estado de la notificacion
    estado = models.BooleanField(default=True)
    # campo de fecha de notificacion
    fecha = models.DateTimeField(verbose_name='Fecha de notifiacion', null=False, default=now, blank=True)
