from http import HTTPStatus
from sprint.urls import *
from django.test import Client
from django.test import TestCase
from sprint.models import *
from sprint.forms import *
from project.models import *
from us.models import *
import datetime
"""
    Módulo de definición de pruebas unitarias con respecto a la aplicación Sprint
"""


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

    # Probamos si un formulario es válido
    def test_form_crear_sprint_valido(self):
        # definimos los datos necesarios para el formulario
        fecha_inicio = datetime.datetime.now().today()
        fecha_fin = fecha_inicio + datetime.timedelta(days=5)
        data_form = {
            'id': 1,
            'name': 'Sprint_1',
            'us': Us.objects.filter(id=1),
            'proyecto': Proyecto.objects.filter(id=1),
            'fecha_inicio': fecha_inicio,
            'fecha_fin': fecha_fin,
            'estado': 1
        }
        # instanciamos la clase del formulario de creacion de sprint
        formulario = crearSprintForm(data_form)
        # comprobamos si es o no válido
        self.assertTrue(formulario.is_valid(), 'El formulario no es válido')




