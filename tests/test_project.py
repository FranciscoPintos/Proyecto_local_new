from django.test import TestCase
# definido en [[models.py]]
from project.models import *
from datetime import date
from datetime import timedelta
from project.forms import *


class TestProyecto(TestCase):
    # cargar los datos a ser utilizados
    def setUp(self):
        Proyecto.name = 'proyecto1'
        Proyecto.active = True
        Proyecto.estado = 'E'
        Proyecto.creator = 2

    # Espacio de pruebas unitarias respecto al estado del proyecto

    def test_proyecto_espera(self):
        # estado en espera
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

    # Espacio de pruebas unitarias respecto al estado activo o inactivo de un proyecto

    def test_proyecto_activo(self):
        # verificar si el proyecto está activo o no
        self.assertTrue(Proyecto.active, 'El proyecto no esta activo')

        """

            POR SI CAMBIAMOS EL PARAMETRO A INACTIVO

            def test_proyecto_no_activo(self):
                self.assertFalse(Proyecto.active, "El proyecto esta activo")

        """

    # Espacio de pruebas unitarias respecto al nombre del proyecto

    def test_proyecto_nombre(self):
        # verificamos si el nombre del proyecto fue escrito correctamente
        self.assertEqual(Proyecto.name, 'proyecto1', 'Nombre del proyecto no coincide')

    # Espacio de pruebas unitarias respecto al id del creador del proyecto

    def test_proyecto_creador(self):
        # verificamos si el id del proyecto fue escrito correctamente
        self.assertEqual(Proyecto.creator, 2, 'El id del creador del proyecto no coincide')

    # comprobamos que el formulario pueda tomar los valores correctos
    # probamos un formulario
    def test_form_crear_proyecto_valido_1(self):
        fecha_inicio = date.today()
        fecha_fin = fecha_inicio + timedelta(days=5)
        data_form = {
            'name': 'Proyecto_1',
            'fecha_inicio': fecha_inicio,
            'fecha_fin': fecha_fin
        }
        formulario = ProyectoForm(data_form)
        self.assertTrue(formulario.is_valid, 'El formulario no es valido')

    # comprobamos que el formulario pueda tomar los valores correctos
    # probamos otro formulario válido
    def test_form_crear_proyecto_valido_2(self):
        fecha_inicio = date.today() + timedelta(days=6)
        fecha_fin = fecha_inicio + timedelta(days=10)
        data_form = {
            'name': 'Proyecto_2',
            'fecha_inicio': fecha_inicio,
            'fecha_fin': fecha_fin
        }
        formulario = ProyectoForm(data_form)
        self.assertTrue(formulario.is_valid, 'El formulario no es valido')

    # # comprobamos que el formulario reconozca un data_form invalido
    # # probamos un formulario vacio
    # def test_form_crear_proyecto_invalido_1(self):
    #     data_form = {
    #
    #     }
    #     formulario = ProyectoForm(data_form)
    #     self.assertTrue(formulario.is_valid, 'El formulario no es valido')

    # # comprobamos que el formulario pueda tomar los valores correctos
    # # probamos otro formulario esta vez sin nombre
    # def test_form_crear_proyecto_invalido_2(self):
    #     fecha_inicio = date.today() + timedelta(days=6)
    #     fecha_fin = fecha_inicio + timedelta(days=10)
    #     data_form = {
    #         'fecha_inicio': fecha_inicio,
    #         'fecha_fin': fecha_fin
    #     }
    #     formulario = ProyectoForm(data_form)
    #     self.assertTrue(formulario.is_valid, 'El formulario no es valido')