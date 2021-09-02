from django.test import TestCase
from Proyecto_local_new.usuario.models import UsuarioManager, Usuario
import unittest


class TestUsuarios(TestCase):

    #definicion de objetos a ser utilizados en las pruebas
    def setUp(self):
        #definicion de super usuario de prueba
        self.user = UsuarioManager.objects.create_user(
            username = 'super_usuario_prueba',
            email = 'super_prueba@example.com',
            names = 'super_usuario',
            password = '123456',
            #True indica que es un usuario administrador
            is_staff = True
        )
        #definicion de usuario de prueba
        self.user = Usuario.objects.create_user(
            username = 'usuario_prueba',
            email = 'prueba@example.com',
            names = 'usuario',
            password = '1234',
            is_staff = False
        )


    def test_super_usuario(self):
        #verificamos que sea un usuario activo
        self.assertEqual(self.user.is_active, True)
        #verificamos que sea un super usuario
        self.assertEqual(self.user.is_staff, True)

    def test_usuario(self):
        # verificamos que sea un usuario activo
        self.assertEqual(self.user.is_active, True)
        # verificamos que sea un super usuario
        self.assertEqual(self.user.is_staff, False)


if __name__ == '__main__':
    unittest.main()

