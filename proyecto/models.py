from django.db import models

# Create your models here.
from usuario.models import Usuario


class Proyecto(models.Model):
    ESTADOS = (
        ('E', 'Espera'),
        ('I', 'Iniciado'),
        ('P', 'Pausado'),
        ('C', 'Cancelado')
    )
    name = models.CharField(max_length=50, verbose_name='Nombre')
    creator = models.ForeignKey(Usuario, verbose_name='Creador', on_delete=models.CASCADE)
    fecha_inicio = models.DateField(verbose_name='Fecha de creación', blank=True, null=True)
    fecha_fin = models.DateField(verbose_name='Fecha de Finalización', blank=True, null=True)
    active = models.BooleanField(default=True)
    estado = models.CharField(max_length=20, choices=ESTADOS, default='E')
    #miembros debe ser una relación desde la case Miembro


    def __str__(self):
        return self.name + ' ' + self.creator.__str__()

    def delete(self):
        self.active = False
        self.save()

    class Meta:
        db_table = 'proyecto'

def set_can_buy_beer(sender, instance, **kwargs):
    ''' Trigger body '''
    if instance.age >= 21:
        instance.can_buy_beer = True
    else:
        instance.can_buy_beer = False
