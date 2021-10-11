from django.test import TestCase
from notificacion.models import *


class TestNotificacion(TestCase):
    #definimos un caso de prueba base
    def setUp(self):
        Notificacion.user = 1
        Notificacion.descripcion = 'Descripcion'
        Notificacion.estado = True

    #Ahora procederemos a comprobar la validez de los parametros

    # Espacio de definicion de prueba unitaria de id del usuario para la notificacion
    def test_user_notificacion(self):
        self.assertEqual(Notificacion.user, 1, 'El id de la notificacion no coincide')

    # Espacio de definicion de prueba unitaria de la descripcion de la notificacion
    def test_descripcion_notificacion(self):
        self.assertEqual(Notificacion.descripcion, 'Descripcion', 'La descripcion de la notificacion no coincide')

    # Espacio de definicion de prueba unitaria del estado de la notificacion
    def test_estado_notificacion(self):
        self.assertTrue(Notificacion.estado, 'El estado de la notificacion no coincide')