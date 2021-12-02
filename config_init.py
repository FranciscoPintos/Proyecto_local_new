from django.test import TestCase
from Proyecto.wsgi import *
from usuario.models import  *

U2 = Usuario.objects.get(id=2)
R1 = RolSistema()

R1.name = 'RolAux'
R1.add_pemission_str('add_proyecto')

U2.rol

print()
