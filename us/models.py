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

#definicion del modelo de de tabla Comentario
class Comentarios(models.Model):
    #debe poseer un id como clave primaria
    id = models.AutoField(primary_key=True)
    #otro campo debe ser el comentario en sí
    comentarios=models.CharField(max_length=2000)
    #debe poder relacionarse con algún us por medio de una clave foránea
    us = models.ForeignKey(Us, on_delete=models.CASCADE, blank=True, null=False)
    #debe poder relacionarse con algún proyecto por medio de una clave foránea
    project = models.ForeignKey(Proyecto, on_delete=models.CASCADE, blank=True, null=False)
    #debe poder relacionarse con algún usuario
    creador = models.ForeignKey(Usuario, on_delete=models.CASCADE, blank=True, null=False)
    #para poder separar los comentarios eliminados de los que no han sido eliminados
    activo = models.BooleanField(default=True)

    #metodo para guardar los valores en la bd
    def save(self, *args, **kwargs):
        super(Comentarios, self).save(*args, **kwargs)
        #se instancia la clase HistorialComentarios
        hc = HistorialComentarios()
        #se trae el id del comentario
        c = Comentarios.objects.get(id= self.id)
        #se trae el nombre del us
        us = Us.objects.get(id= self.us.id)
        #se trae el nombre del protecto
        p = Proyecto.objects.get(id=self.project.id)
        #se trae el nombre del usuario
        cr = Usuario.objects.get(id=self.creador.id)
        hc.comentario = c
        hc.us_name = us.name
        hc.project_name = p.name
        hc.creator_name = cr.first_name
        hc.comentarios = c.comentarios
        hc.activo = c.activo
        hc.save()

    def __str__(self):
        return '{}'.format(self.id)

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Comentarios'
        db_table = 'comentarios'
        ordering = ['id', 'creador']
        permissions = (
            ('add_comment', 'Can add Us to Product Backlog'),
            ('view_comment', 'Can view Us to Product Backlog'),
            ('delete_comment', 'Can delete Us to Product Backlog'),
            ('modify_comment', 'Can modify comment'))

class HistorialComentarios(models.Model):
    
    id = models.AutoField(primary_key=True)
    comentario = models.ForeignKey(Comentarios, on_delete=models.CASCADE)
    us_name = models.CharField('Nombre de User Story', max_length=50, null=True)
    project_name = models.CharField('Nombre de Proyecto', max_length=50, null=True)
    creator_name = models.CharField('Nombre de Creador', max_length=50, null=True)
    comentarios = models.CharField('Contenido del comentario', max_length=2000, null=True)
    creador = models.ForeignKey(Usuario, on_delete=models.CASCADE, null=True)
    fecha_modificacion = models.DateTimeField(verbose_name='Fecha de modificacion', blank=True, null=True, default=now)

class HistorialUs(models.Model):
    ustory = models.ForeignKey(Us, on_delete=models.CASCADE, null=True)
    name = models.CharField('Nombre', max_length=50, unique=False)
    descripcion = models.CharField(max_length=2000)
    prioridad = models.IntegerField()
    estado = models.IntegerField( )
    storypoints = models.PositiveIntegerField(null=True)
    user= models.ForeignKey(Usuario, on_delete=models.CASCADE, null=True)
    fecha_modificacion = models.DateTimeField(verbose_name='Fecha de modificacion', blank=True, null=True, default=now)
