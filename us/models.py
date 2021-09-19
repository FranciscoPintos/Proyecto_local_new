from django.db import models
from django import forms
from django.forms import model_to_dict
from django.utils.timezone import now

from etiqueta.models import Etiqueta
from miembros.models import Miembro
from project.models import *
from usuario.models import *
# Create your models here.

class Us(models.Model):
    dif_define = [
        (1, 'No urgente'), (2, 'Menos urgente'), (3, 'Media'), (4, 'Alta'), (5, 'Urgente'),
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
    storypoints= models.PositiveIntegerField(null=True, blank=True)
    estado=models.IntegerField(
        choices=status,
        default= 1
    )
    project = models.ForeignKey(Proyecto, on_delete=models.CASCADE, blank=True, null=False)
    user=models.ForeignKey(Miembro, on_delete=models.CASCADE, blank=True, null=True)
    activo= models.BooleanField(default=True)
    etiqueta = models.ForeignKey(Etiqueta, on_delete=models.CASCADE, null = True, blank=True)

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
        ordering = ['prioridad', 'name']
        permissions = (
            ('add_usproductbacklog', 'Can add Us to Product Backlog'),
            ('view_usproductbacklog', 'Can view Us to Product Backlog'),
            ('delete_usproductbacklog', 'Can delete Us to Product Backlog'),
            ('change_usproductbacklog', 'Can view Us to Product Backlog'),
            ('valuate_us', 'Can calificate Us to Sprint Backlog'))


class HistorialUs(models.Model):
    ustory = models.ForeignKey(Us, on_delete=models.CASCADE, null=True)
    name = models.CharField('Nombre', max_length=50, unique=False)
    descripcion = models.CharField(max_length=2000)
    prioridad = models.IntegerField()
    estado = models.IntegerField( )
    storypoints = models.PositiveIntegerField(null=True)
    user= models.ForeignKey(Usuario, on_delete=models.CASCADE, null=True)
    fecha_modificacion = models.DateTimeField(verbose_name='Fecha de modificacion', blank=True, null=True, default=now)
