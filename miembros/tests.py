from django.test import TestCase
from Proyecto.wsgi import *
from miembros.models import *
from usuario.models import *
from project.models import *

import datetime

print(Permission.objects.all())