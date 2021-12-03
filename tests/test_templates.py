from django.test import TestCase
from django.urls import reverse
from project.models import *
from usuario.models import *
from project.urls import *


class TestTemplates(TestCase):

    # definicion de pruebas para la aplicacion loginSSO

    # prueba del template de login del sistema
    def test_template_login(self):
        # hacemos la peticion al template para verificar
        response = self.client.get(reverse(viewname='login'))
        # probamos que el template retorne como codigo de estado 200
        self.assertEqual(response.status_code, 200, 'No se ha podido acceder al login del sistema')

    # prueba del template de pantalla
    def test_template_pantalla(self):
        # hacemos la peticion al template
        response = self.client.get(reverse(viewname='pantalla'))
        # probamos que el codigo de respuesta sea el 200
        self.assertEqual(response.status_code, 200, 'No se ha podido acceder al template')

    # prueba del template login super usuario del sistema
    def test_template_super(self):
        # creamos la respuesta al template
        response = self.client.get(reverse(viewname='login_super'))
        # comprobamos que el codigo de estado sea 200
        self.assertEqual(response.status_code, 200, 'No fue posible visualizar el template')


    # definicion de pruebas para la aplicacion principalApṕ

    # prueba el template de la pagina de calendario del sistema
    def test_template_base(self):
        # creamos la respuesta al template
        response = self.client.get(reverse(viewname='calendar'))
        # aqui probamos que el codigo de estado sea el 200
        self.assertEqual(response.status_code, 200, 'No fue posible cargar el template')


    # def test_template_ver_proyecto(self):
    #     creador = Usuario.objects.create()
    #     proyecto = Proyecto.objects.create(creator=creador)
    #     response = self.client.get(reverse(viewname='misproyectos', kwargs={'id':proyecto.id}))
    #     self.assertEqual(response.status_code, 200, 'No fue posible acceder al template')

    # def test_template_crear_proyecto(self):
    #     creador = Usuario.objects.create()
    #     proyecto = Proyecto.objects.create(creator=creador)
    #     response = self.client.get(reverse(viewname='crearProyecto', kwargs={'pk':proyecto.id}))
    #     self.assertEqual(response.status_code, 200, 'No fue posible acceder al template de creacion de proyecto')
