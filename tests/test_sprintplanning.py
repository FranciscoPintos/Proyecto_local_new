from django.test import TestCase
from sprintPlanning.models import *


class TestSprintPlanning(TestCase):
    #definimos un caso de prueba base
    def setUp(self):
        SprintPlanning.sprint = 1

    # Ahora procederemos a comprobar la validez de los parametros

    # Espacio de definicion de prueba unitaria de id del sprintplanning
    def test_id_sprint(self):
        self.assertEqual(SprintPlanning.sprint, 1, 'El id del sprintplanning no coincide')