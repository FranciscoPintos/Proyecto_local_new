from django.test import TestCase
from equipo.models import *


class TestEquipo(TestCase):
    #definimos un caso base de prueba
    def setUp(self):
        Equipo.id = 1
        Equipo.sprint = 1
        Equipo.capacidad = 10

    #Ahora procederemos a comprobar la validez de los parametros

    #Espacio de definicion de prueba unitaria de id de equipo
    def test_id_equipo(self):
        self.assertEqual(Equipo.id, 1, 'El id del equipo no coincide')

    #Espacio de definicion de prueba unitaria de id de sprint
    def test_id_sprint(self):
        self.assertEqual(Equipo.sprint, 1, 'El id de sprint del equipo no coincide')
        
    #Espacio de definicion de prueba unitaria de la capacidad de equipo
    def test_capacidad(self):
        self.assertEqual(Equipo.capacidad, 10, 'La capacidad del equipo no coincide')