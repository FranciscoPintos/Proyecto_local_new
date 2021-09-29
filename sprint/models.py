from django.db import models
from django import forms
from django.forms import model_to_dict
from django.utils.timezone import now


# Create your models here.
class Sprint(models.Model):

    id = models.AutoField(primary_key=True)
    name = models.CharField('Nombre', max_length=50)

    def __str__(self):
        return '{}'.format(self.name)

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Sprint'
        db_table = 'sprint'
        ordering = ['name']
