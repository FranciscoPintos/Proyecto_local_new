from django.test import TestCase
from Proyecto.wsgi import *
from principalApp.models import *

import datetime

# creating an instance of
# datetime.date
d = datetime.date(1997, 10, 14) # %y/$m/%d
# Insertar datos

p1 = Usuario()
p1.names = 'Usuario2'
p1.ci = '1111116'
p1.fecha_nac = d
p1.lastname = 'Test'

#p1.save()

# Visualizar datos
print(Usuario.objects.all())

# Create your tests here.

pr1 = Proyecto()
pr1.name = 'Proyecto01'
pr1.creator = 1
