from django.db import models
from django import forms
from django.forms import model_to_dict
# Create your models here.

class Us(models.Model):
    dif_define=[
        (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),
    ]
    status=[
        (1,'To Do'),(2,'Doing'),(3,'QA'),(4,'Done'),
    ]
    id = models.AutoField(primary_key=True)
    name = models.CharField('Nombre', max_length=50, unique=True)
    descripcion=models.CharField(max_length=2000)
    dificultad=models.IntegerField(
        null=False, blank=False,
        choices=dif_define,
        default=1
    )
    estado=models.IntegerField(
        null=False, blank=False,
        choices=status,
        default= 1
    )

    def __str__(self):
        return '{}'.format(self.name)

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Us'
        db_table = 'Us'
        ordering = ['name']
