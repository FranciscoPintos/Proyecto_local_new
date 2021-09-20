from django.db import models
from django.utils.timezone import now

from project.models import Proyecto
from usuario.models import Usuario


class Etiqueta(models.Model):
    """Abstración de una etiqueta para representar clasificacion de User Stories
    Representa el tipo de trabajo que se realizarìa con un User Story, si es de; Vista, seguridad, Backend, u otros tipos de clasificación
    """

    # Nombre de Etiqueta
    name = models.CharField(verbose_name='Nombre', max_length=50, null=False)
    # Usuario creador
    user = models.ForeignKey(Usuario, verbose_name='Creador', on_delete=models.CASCADE, null=False, related_name='user_etiqueta_set', blank=True)
    # Fecha de creación
    fecha_creacion = models.DateField(verbose_name='Fecha de creacion', null=False, default=now, blank=True)
    # Etiqueta eliminada o no eliminada
    activo = models.BooleanField(verbose_name='activo/eliminado', default=True, blank=True)
    # A que proyecto pertenece la etiqueta
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE, verbose_name='Proyeco al que pertenecet', null=False, blank=True)

    class Meta:
        verbose_name = 'Etiqueta'
        db_table = 'etiqueta'
        ordering = ['name']
