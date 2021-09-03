from django.test import TestCase

from proyecto.models import Proyecto


class TestProyecto(TestCase):
    #cargar los datos a ser utilizados
    def setUp(self):
        Proyecto.name = 'proyecto1'
        Proyecto.active = True
        Proyecto.estado = 'E'

    def test_proyecto_espera(self):
        #estado en espera
        self.assertEqual(Proyecto.estado, 'E', 'El proyecto no esta en estado de Espera')

    def test_proyecto_iniciado(self):
        #verificar si el proyecto se encuentra iniciado o no
        self.assertEqual(Proyecto.estado, 'I', "El proyecto no esta en estado Iniciado")

    def test_proyecto_pausado(self):
        #verificar si el proyecto se encuentra pausado o no
        self.assertEqual(Proyecto.estado, 'P', 'El proyecto no esta en estado pausado')

    def test_proyecto_cancelado(self):
        #verificar si el proyecto se encuentra cancelado o no
        self.assertEqual(Proyecto.estado, 'C', 'El proyecto no esta en estado cancelado')

    def test_proyecto_activo(self):
        #verificar si el proyecto está activo o no
        self.assertTrue(Proyecto.active, 'El proyecto no esta activo')

    def test_proyecto_no_activo(self):
        self.assertFalse(Proyecto.active, "El proyecto esta activo")

    def test_proyecto_nombre(self):
        #verificamos si el nombre del proyecto fue escrito correctamente
        self.assertEqual(Proyecto.name, 'proyecto1', 'Nombre del proyecto no coincide')

