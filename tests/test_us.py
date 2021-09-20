from django.test import TestCase
from us.models import *


#Espacio de definicion de pruebas unitarias referentes al modelo Us
class TestUs(TestCase):
    #definicion de caso base de prueba
    def setUp(self):
        Us.id = 1
        Us.name = 'US1'
        Us.descripcion = 'Descripcion'
        Us.prioridad = (1, 'No urgente')
        Us.storypoints = 10
        Us.estado = (1, 'To Do')
        Us.project = 1
        Us.user = 1
        Us.activo = True
        Us.etiqueta = 1

    #Espacio de definicion de prueba referente al id del us
    def test_id_us(self):
        self.assertEquals(Us.id, 1, 'El id no coincide')
    
    #Espacio de definicion de prueba referente al nombre del us
    def test_name_us(self):
        self.assertEquals(Us.name, 'US1', 'El nombre no coincide')

    #Espacio de definicion de prueba referente a la descripcion del us
    def test_descripcion(self):
        self.assertEquals(Us.descripcion, 'Descripcion', 'La descripcion no coincide')

    #Espacio de definicion de prueba referente a la prioridad
    def test_prioridad(self):
        self.assertEquals(Us.prioridad, (1, 'No urgente'), 'La prioridad no coincide')

    #Espacio de definicion de prueba refente a los storypoints de un us
    def test_story_points(self):
        self.assertEquals(Us.storypoints, 10, 'El story point no coincide')

    #Espacio de definicion de prueba referente al estado del us
    def test_estado(self):
        self.assertEquals(Us.estado, (1, 'To Do'), 'El estado no coincide')

    #Espacio de definicion de prueba referente al id de proyecto
    def test_id_project(self):
        self.assertEquals(Us.project, 1, 'El ID de proyecto no coincide')

    #Espacio de definicion de prueba referente al id de usuario
    def test_id_user(self):
        self.assertEquals(Us.user, 1, 'El ID de usuario no coincide')

    #Espacio de definicion de prueba refente al estado activo o inactivo del us
    def test_us_is_active(self):
        self.assertEquals(Us.activo, True, 'El estado no coincide')

    #Espacio de definicion de prueba referente al id de etiqueta
    def test_id_tag(self):
        self.assertEquals(Us.etiqueta, 1, 'El ID de etiqueta no coincide')


#Espacio de definicion de pruebas unitarias referentes al modelo Comentarios
class TestComentarios(TestCase):
    #definicion de caso base de prueba
    def setUp(self):
        Comentarios.id = 1
        Comentarios.comentarios = 'comentario'
        Comentarios.us = 1
        Comentarios.project = 1
        Comentarios.creador = 1

    #Espacio de definicion de prueba referente al id de Comentario
    def test_id_comment(self):
        self.assertEquals(Comentarios.id, 1, 'El ID de comentario no coincide')

    #Espacio de definicion de prueba referente al comentario
    def test_comentarios(self):
        self.assertEquals(Comentarios.comentarios, 'comentario', 'El comentario no coincide')

    #Espacio de definicion de prueba referente al id de us
    def test_id_us(self):
        self.assertEquals(Comentarios.us, 1, 'El ID de us no coincide')

    #Espacio de definicion de prueba referente al id de proyecto
    def test_id_tag(self):
        self.assertEquals(Comentarios.project, 1, 'El ID de proyecto no coincide')

    #Espacio de definicion de prueba referente al id del creador
    def test_id_tag(self):
        self.assertEquals(Comentarios.creador, 1, 'El ID del creador no coincide')