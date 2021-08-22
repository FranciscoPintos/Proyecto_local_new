from django.db import models

# Create your models here.

class Usuario(models.Model):
    names = models.CharField(max_length=50, verbose_name='nombres')
    lastname = models.CharField(max_length=50, verbose_name='apellidos')
    ci = models.CharField(max_length=10,unique=True,  verbose_name='Cedula')
    email = models.CharField(max_length=70, verbose_name='emaill')
    fecha_nac = models.DateField()
    estado = models.BooleanField(default=True)

    def __str__(self):
        return self.names + ' ' + self.fecha_nac.__str__()

    class Meta:
        db_table = 'usuario'

class Proyecto(models.Model):
    name = models.CharField(max_length=50, verbose_name='Nombre')
    creator = models.IntegerField( verbose_name='Creador')

    def __str__(self):
        return self.name + ' ' + self.creator.__str__()

    class Meta:
        db_table = 'proyecto'
