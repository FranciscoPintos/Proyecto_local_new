import datetime

from django.db import models

# Create your models here.
from sprint.models import Sprint
from us.models import Us
from django.utils.timezone import now

class Tarea(models.Model):
    ustory = models.ForeignKey(Us, on_delete=models.CASCADE, null=True)
    descripcion = models.CharField(max_length=2000)
    horas = models.PositiveIntegerField()
    fecha_creacion = models.DateField(verbose_name='Fecha de creación', blank=True, null=True, default=now)
    sprimt= models.ForeignKey(Sprint, on_delete=models.CASCADE, null=True)
    def save(self, *args, **kwargs):
        super(Tarea, self).save(*args, **kwargs)
        ht= HistorialTarea()
        us = Tarea.objects.get(id=self.id)
        ht.tarea= us
        ht.descripcion= us.descripcion
        ht.hora= us.horas
        ht.sprimt= us.sprimt
        ht.save()

    def __str__(self):
        return '{}'.format(self.descripcion)
    class Meta:
        verbose_name = 'Tarea'
        db_table = 'tarea'
        ordering = ['fecha_creacion']
class HistorialTarea(models.Model):
    tarea = models.ForeignKey(Tarea, on_delete=models.CASCADE, null=True)
    descripcion = models.CharField(max_length=2000)
    hora = models.PositiveIntegerField()
    fecha_modificacion =  models.DateTimeField(verbose_name='Fecha de modificacion', blank=True, null=True, default=now)
    sprimt = models.ForeignKey(Sprint, on_delete=models.CASCADE, null=True)
    class Meta:
        verbose_name = 'HistorialTarea'
        db_table = 'historial_tarea'
        ordering = ['fecha_modificacion']