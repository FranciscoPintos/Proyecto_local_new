from django.test import TestCase
from tarea.models import *
from tarea.forms import *
import datetime


#Espacio de definicion de pruebas unitarias referentes al modelo Tarea
class TestTarea(TestCase):
    #definicion de caso base de prueba
    def setUp(self):
        Tarea.ustory = 1
        Tarea.descripcion = 'Tarea'
        Tarea.horas = 10

    #Espacio de definicion de prueba unitaria referente al id del user story
    def test_us(self):
        self.assertEqual(Tarea.ustory, 1, 'El ID del User Story no coincide')

    #Espacio de definicion de prueba unitaria referente a la descripcion de la tarea
    def test_descripcion(self):
        self.assertEqual(Tarea.descripcion, 'Tarea', 'La descripcion de la tarea no coincide')

    #Espacio de definicion de prueba unitaria referente a las horas de trabajo
    def test_horas(self):
        self.assertEqual(Tarea.horas, 10, 'La cantidad de horas no coincide')

    # definicion de prueba unitaria para el formulario de creacion de tarea
    def test_form_tarea(self):
        fecha_creacion = datetime.datetime.now().today()
        data_form = {
            'descripcion': 'Descripcion de una tarea',
            'horas': 20,
            'fecha_creacion': fecha_creacion
        }
        formulario = crearTarea(data_form)
        self.assertTrue(formulario.is_valid, "El formulario no es válido")

#Espacio de definicion de pruebas unitarias referentes al modelo HistorialTarea
class TestHistorialTarea(TestCase):
    #definicion de caso base de prueba
    def setUp(self):
        HistorialTarea.tarea = 1
        HistorialTarea.descripcion = 'Historial'
        HistorialTarea.hora = 10

    #Espacio de definicion de pruebas unitarias referentes al ID de la tarea
    def test_tarea(self):
        self.assertEqual(HistorialTarea.tarea, 1, 'El ID  de tarea no coincide')

    #Espacio de definicion de pruebas unitarias referentes a la descripcion de la tarea
    def test_descripcion_tarea(self):
        self.assertEqual(HistorialTarea.descripcion, 'Historial', 'La descripcion de la tarea no coincide')

    #Espacio de definicion de pruebas unitarias referentes a las horas
    def test_horas(self):
        self.assertEqual(HistorialTarea.hora, 10, 'Las horas no coinciden')