from django.db import models
from django import forms
from django.forms import model_to_dict
from django.utils.timezone import now

from us.models import *

# Create your models here.
class Sprint(models.Model):

    id = models.AutoField(primary_key=True)
    name = models.CharField('Nombre', max_length=50)
    us = models.ManyToManyField(Us, blank=True)
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    # Fecha inicio
    fecha_incio = models.DateField()
    # Fecha fin
    fecha_fin = models.DateField()
    status = [
        (1, 'To Do'), (2, 'Doing'), (3, 'Done'),
    ]
    estado = models.IntegerField(
        choices=status,
        default=1
    )
    def __str__(self):
        return '{}'.format(self.name)

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Sprint'
        db_table = 'sprint'
        ordering = ['name']
