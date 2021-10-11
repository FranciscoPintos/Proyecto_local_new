from django.test import TestCase
from sprint.models import *


class TestSprint(TestCase):
    #definimos un caso de prueba base
    def setUp(self):
        Sprint.id = 1
        Sprint.name = 'Sprint 1'
        Sprint.proyecto = 1
        Sprint.estado = 1

    #Ahora procederemos a comprobar la validez de los parametros

    # Espacio de definicion de prueba unitaria de id del sprint
    def test_id_sprint(self):
        self.assertEqual(Sprint.id, 1, 'El id del sprint no coincide')

    # Espacio de definicion de prueba unitaria del nombre del sprint
    def test_name_sprint(self):
        self.assertEqual(Sprint.name, 'Sprint 1', 'El nombre del sprint no coincide')

    # Espacio de definicion de prueba unitaria del id del proyecto al cual pertenece el sprint
    def test_id_proyecto(self):
        self.assertEqual(Sprint.proyecto, 1, 'El id del proyecto no coincide')

    # Espacio de definicion de prueba unitaria para el estado del sprint
    def test_estado_sprint(self):
        self.assertEqual(Sprint.estado, 1, 'El estado del sprint no coincide')