from django.db import models
from django.utils.timezone import now
from usuario.models import Usuario


class Notificacion(models.Model):
    user = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    descripcion = models.CharField(max_length=2000)
    estado = models.BooleanField(default=True)
    fecha = models.DateTimeField(verbose_name='Fecha de notifiacion', null=False, default=now, blank=True)
