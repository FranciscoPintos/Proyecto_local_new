from django.test import TestCase
#definido en [[models.py]]
from etiqueta.models import *

class TestEtiqueta(TestCase):
    #definimos un caso base de prueba
    def setUp(self):
        Etiqueta.name = 'Etiqueta1'
        Etiqueta.user = 1
        Etiqueta.activo = True
        Etiqueta.proyecto = 1
    #Ahora procederemos a comprobar la validez de los parametros

    #Espacio de definicion de prueba unitaria de nombre de etiqueta
    def test_name_tag(self):
        self.assertEqual(Etiqueta.name, 'Etiqueta1', 'El nombre de etiqueta no coincide')
    
    #Espacio de definicion de prueba unitaria de id de usuario
    def test_id_user_tag(self):
        self.assertEqual(Etiqueta.user, 1, 'El id de usuario no coincide')

    #Espacio de definicion de prueba unitaria de estado del tag
    def test_tag_is_active(self):
        self.assertTrue(Etiqueta.activo, 'La etiqueta no está activa')

    #Espacio de definicion de prueba unitaria de id de proyecto al que pertenece el tag
    def test_id_project(self):
        self.assertEqual(Etiqueta.proyecto, 1, 'El ID no proyecto no coincide')