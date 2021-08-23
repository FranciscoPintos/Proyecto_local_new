from django.db import models

# Create your models here.

class Proyecto(models.Model):
    name = models.CharField(max_length=50, verbose_name='Nombre')
    creator = models.IntegerField( verbose_name='Creador')

    def __str__(self):
        return self.name + ' ' + self.creator.__str__()

    class Meta:
        db_table = 'proyecto'

def set_can_buy_beer(sender, instance, **kwargs):
    ''' Trigger body '''
    if instance.age >= 21:
        instance.can_buy_beer = True
    else:
        instance.can_buy_beer = False
