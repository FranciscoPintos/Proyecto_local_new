from django.test import TestCase

from Proyecto_local_new.proyecto.models import Proyecto


class TestProyecto(TestCase):

    def test_proyecto(self):

        Proyecto.name = 'proyecto1'
        Proyecto.active = True
        Proyecto.estado = 'E'

        #verificamos si realiza la asignacion correctamente
        self.assertEqual(Proyecto.name, 'proyecto1')
        #si es un proyecto activo
        self.assertTrue(Proyecto.active)
        #estado en espera
        self.assertEqual(Proyecto.estado, 'E')