from django.test import TestCase
from usuario.models import UsuarioManager, Usuario
import unittest


class TestUsuarios(TestCase):

    #definicion de objetos a ser utilizados en las pruebas
    def setUp(self):
        #definicion de super usuario de prueba
        self.user = UsuarioManager.create_user(
            self,
            username='super_usuario_prueba',
            email='super_prueba@example.com',
            names='super_usuario',
            password='123456'
        )
        #definicion de usuario de prueba
        self.user = Usuario.create_user(
            username='usuario_prueba',
            email='prueba@example.com',
            names='usuario',
            password='1234'
        )


    def test_super_usuario(self):
        #verificamos que sea un usuario activo
        self.assertEqual(self.user.is_active, True, 'El usuario no esta activo')
        #verificamos que sea un super usuario
        self.assertEqual(self.user.is_staff, True, 'Este usuario no es un super usuario')

    def test_usuario(self):
        # verificamos que sea un usuario activo
        self.assertEqual(self.user.is_active, True, 'El usuario no esta activo')
        # verificamos que sea un super usuario
        self.assertEqual(self.user.is_staff, False, 'Este usuario si es un super usuario')


if __name__ == '__main__':
    unittest.main()

