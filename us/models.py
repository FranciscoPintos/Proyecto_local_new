from django.db import models
from django import forms
from django.forms import model_to_dict
from django.utils.timezone import now

from miembros.models import Miembro
from project.models import *
from usuario.models import *
# Create your models here.

class Us(models.Model):
    dif_define=[
        (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),
    ]
    status=[
        (1,'To Do'),(2,'Doing'),(3,'QA'),(4,'Done'),
    ]
    id = models.AutoField(primary_key=True)
    name = models.CharField('Nombre', max_length=50)
    descripcion=models.CharField(max_length=2000)
    prioridad=models.IntegerField(
        choices=dif_define,
        default=1
    )
    storypoints= models.PositiveIntegerField(null=True)
    estado=models.IntegerField(
        choices=status,
        default= 1
    )
    project = models.ForeignKey(Proyecto, on_delete=models.CASCADE, blank=True, null=True)
    user=models.ForeignKey(Miembro, on_delete=models.CASCADE, blank=True, null=True)
    activo= models.BooleanField(default=True)
    def save(self, *args, **kwargs):
        super(Us, self).save(*args, **kwargs)
        hu= HistorialUs()
        us= Us.objects.get(id= self.id)
        hu.ustory= us
        hu.name = us.name
        hu.descripcion= us.descripcion
        hu.prioridad= us.prioridad
        hu.estado= us.estado
        hu.storypoints= us.storypoints
        hu.save()
    def __str__(self):
        return '{}'.format(self.name)

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Us'
        db_table = 'us'
        ordering = ['name']
class HistorialUs(models.Model):
    ustory = models.ForeignKey(Us, on_delete=models.CASCADE, null=True)
    name = models.CharField('Nombre', max_length=50, unique=False)
    descripcion = models.CharField(max_length=2000)
    prioridad = models.IntegerField()
    estado = models.IntegerField( )
    storypoints = models.PositiveIntegerField()
    user= models.ForeignKey(Usuario, on_delete=models.CASCADE, null=True)
    fecha_modificacion = models.DateTimeField(verbose_name='Fecha de modificacion', blank=True, null=True, default=now)
