from django.db import models

from miembros.models import Miembro
from sprint.models import Sprint


class Equipo(models.Model):
    """
    Abstracción de un grupo de equipo de miembros de un proyecto que trabajarán en un sprint.
    """

    # Sprint al que pertenece
    sprint = models.ForeignKey(Sprint, on_delete=models.CASCADE)
    # Miembros del equipo
    miembros = models.ForeignKey(Miembro, on_delete=models.CASCADE)
    # Capacidad del equipo en horas
    capacidad = models.PositiveIntegerField()

