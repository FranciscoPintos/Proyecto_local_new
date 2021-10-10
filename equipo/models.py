from django.db import models

from miembros.models import Miembro
from sprint.models import Sprint


class Equipo(models.Model):
    """
    Abstracción de un grupo de equipo de miembros de un proyecto que trabajarán en un sprint.
    """
    #id del equipo
    id = models.AutoField(primary_key=True)
    # Sprint al que pertenece
    sprint = models.ForeignKey(Sprint, on_delete=models.CASCADE, null=True)
    # Miembros del equipo
    miembros = models.ManyToManyField(Miembro, blank=True)
    # Capacidad del equipo en horas
    capacidad = models.PositiveIntegerField(null=True)

