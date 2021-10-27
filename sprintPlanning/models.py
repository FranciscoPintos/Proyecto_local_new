import sprint as sprint
from django.db import models

from sprint.models import Sprint


class SprintPlanning(models.Model):
    """
    Clase de SprintPlanning, sirve para agregar equipos, para crear US y poder planificar
    """
    #Clave foranea de la clase Sprint
    sprint = models.ForeignKey(Sprint, on_delete=models.CASCADE)
    status = [
        (1, 'Definir Fecha'), (2, 'Crear Equipo'), (3, 'Cargar Sprint Backlog'), (4, 'Estimar User Stories')
    ]
    paso = models.IntegerField(
        choices=status,
        default=1
    )
    class Meta:
        verbose_name = 'SprintPlanning'
        db_table = 'sprintplanning'
        ordering = ['sprint']
