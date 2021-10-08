import sprint as sprint
from django.db import models

from sprint.models import Sprint


class SprintPlanning(models.Model):
    """
    Clase de SprintPlanning, sirve para agregar equipos, para crear US y poder planificar
    """
    #Clave foranea de la clase Sprint
    sprint = models.ForeignKey(Sprint, on_delete=models.CASCADE)
    class Meta:
        verbose_name = 'SprintPlanning'
        db_table = 'sprintplanning'
        ordering = ['sprint']
