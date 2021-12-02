from django.test import TestCase
from roles.models import *

#Espacio de de definicion de pruebas unitarias referentes al modelo Rol
#Este modelo hace referencia al Rol de SISTEMA y no de proyecto como en RolProyecto de miembros
class TestRol(TestCase):
    
    #definicion de caso base para pruebas
    def setUp(self):
        Rol.id = 1
        Rol.rol = 'Scrum Master'

    #Espacio de definicion de pruebas relativas al id del rol
    def test_id_rol(self):
        self.assertEqual(Rol.id, 1, 'El ID del rol no coincide')

    #Espacio de definicion de pruebas unitarias relativas al nombre del rol
    def test_rol_name(self):
        self.assertEqual(Rol.rol, 'Scrum Master', 'El nombre del rol no coincide')