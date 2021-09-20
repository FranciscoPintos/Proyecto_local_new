from django.test import TestCase
#definido en [[models.py]]
from miembros.models import *

#Espacio de definicion de pruebas unitarias referentes al modelo Miembro
class TestMiembro(TestCase):
    #definicion de caso base de prueba
    def setUp(self):
        Miembro.user = 1
        Miembro.rol = 1
        Miembro.horaTrabajo = 10
        Miembro.active = True

    #definicion de pruebas unitarias respecto al ID del usuario
    def test_id_user(self):
        self.assertEqual(Miembro.user, 1, 'El ID del miembro no coincide')

    #definicion de pruebas unitarias respecto al ID del rol de usuario
    def test_id_rol(self):
        self.assertEqual(Miembro.rol, 1, 'El ID del rol de usuario no coincide')

    #definicion de pruebas unitarias respecto a las horas de trabajo 
    def test_horas_trabajo(self):
        self.assertEqual(Miembro.horaTrabajo, 10, 'La cantidad de horas de trabajo no coinciden')

    #definicion de prueba unitaria respecto al estado activo o desactivado de mimebro
    def test_estado_miembro(self):
        self.assertTrue(Miembro.active)

#Espacio de definicion de pruebas unitarias referentes al modelo RolProyecto
class TestRolProyecto(TestCase):
    
    #definicion de caso base de prueba
    def setUp(self):
        RolProyecto.project = 1
        RolProyecto.name = 'Scrum Master'

    #Espacio de definicion de prueba unitaria de id de proyecto al cual pertenece el rol
    def test_id_project(self):
        self.assertEqual(RolProyecto.project, 1, 'El ID de proyecto no coincide')

    #Espacio de definicion de prueba unitaria de nombre de rol
    def test_name_rol(self):
        self.assertEqual(RolProyecto.name, 'Scrum Master', 'El nombre del rol no coincide')