from django.db import models
from django import forms
from django.forms import model_to_dict
from django.utils.timezone import now

from project.models import Proyecto
from us.models import Us



# Create your models here.
class Sprint(models.Model):

    id = models.AutoField(primary_key=True)
    name = models.CharField('Nombre', max_length=50)
    us = models.ManyToManyField(Us, blank=True)
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE, null=True)
    # Fecha inicio
    fecha_incio = models.DateField(null=True)
    # Fecha fin
    fecha_fin = models.DateField(null=True)
    status = [
        (1, 'Planning'), (2, 'Activo'), (3, 'Finalizado'),
    ]
    estado = models.IntegerField(
        choices=status,
        default=1
    )
    # equipo=models.ForeignKey(Equipo, on_delete=models.CASCADE,null=True )

    def __str__(self):
        return '{}'.format(self.name)

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Sprint'
        db_table = 'sprint'
        ordering = ['estado']
        permissions = [('charge_sprintplanning', 'Can add Us to Sprint Backlog'),
                       ('view_sprintbacklog', 'Can view Sprint Backlog'),
                       ('view_burdownchart', 'Can view Burdownchart'),
                       ('start_sprint', 'Can start Sprint'),
                       ('end_sprint', 'Can finalize a Sprint')]
