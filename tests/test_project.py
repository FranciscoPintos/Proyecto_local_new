from django.test import TestCase
#definido en [[models.py]]
from project.models import *


class TestProyecto(TestCase):
    #cargar los datos a ser utilizados
    def setUp(self):
        Proyecto.name = 'proyecto1'
        Proyecto.active = True
        Proyecto.estado = 'E'
        Proyecto.creator = 2

    #Espacio de pruebas unitarias respecto al estado del proyecto

    def test_proyecto_espera(self):
        #estado en espera
        self.assertEqual(Proyecto.estado, 'E', 'El proyecto no esta en estado de Espera')


        """

            POR SI CAMBIAMOS LOS PARAMETROS

            def test_proyecto_iniciado(self):
                #verificar si el proyecto se encuentra iniciado o no
                self.assertEqual(Proyecto.estado, 'I', "El proyecto no esta en estado Iniciado")

            def test_proyecto_pausado(self):
                #verificar si el proyecto se encuentra pausado o no
                self.assertEqual(Proyecto.estado, 'P', 'El proyecto no esta en estado pausado')

            def test_proyecto_cancelado(self):
                #verificar si el proyecto se encuentra cancelado o no
                self.assertEqual(Proyecto.estado, 'C', 'El proyecto no esta en estado cancelado')

        """

    #Espacio de pruebas unitarias respecto al estado activo o inactivo de un proyecto

    def test_proyecto_activo(self):
        #verificar si el proyecto está activo o no
        self.assertTrue(Proyecto.active, 'El proyecto no esta activo')

        """

            POR SI CAMBIAMOS EL PARAMETRO A INACTIVO

            def test_proyecto_no_activo(self):
                self.assertFalse(Proyecto.active, "El proyecto esta activo")
        
        """
    #Espacio de pruebas unitarias respecto al nombre del proyecto

    def test_proyecto_nombre(self):
        #verificamos si el nombre del proyecto fue escrito correctamente
        self.assertEqual(Proyecto.name, 'proyecto1', 'Nombre del proyecto no coincide')

    #Espacio de pruebas unitarias respecto al id del creador del proyecto

    def test_proyecto_creador(self):
        #verificamos si el id del proyecto fue escrito correctamente
        self.assertEqual(Proyecto.creator, 2 ,'El id del creador del proyecto no coincide')

    