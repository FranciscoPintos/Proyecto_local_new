
from django.test import TestCase
from Proyecto.wsgi import *
from django.contrib.auth import login, authenticate
from usuario.models import *

# Create your tests here.

a = RolSistema()
a.name = 'Rol 4'
#a.save()
#a.permisos.add(Permission.objects.get(codename='add_proyecto'))
#a.save()

usuario = authenticate(username='Ever_Garay', password='Everfg0405.')

print(usuario)


U = Usuario.objects.get(id=4)

print(U.is_staff)

U = Usuario.objects.get(username='Ever_Garay')
#print(U.get_p)

print(U.is_staff)

#a = RolSistema.objects.get(id=4)
#print(a.has_permission_str('add_proyecto'))



#print(UsuarioManager.all())

#print(a.view_all_permission())

#p1 = a.view_all_permission()
#print(p1.id)
#a = RolSistema.objects.get(id=2)
#a.name = 'prueba 2'
#a.shirt_size = 'H'
#a.save()

#a.permisos.add(p1.id)

p = Usuario()
#p = Usuario.objects.get(id=1)
#print(p.has_perm(('Can add person','add_person')))

#print(a.view_permission())

#print(Permission.objects.all())

#print(a.user_permissions.add('project.change_proyecto'))
#print(a.is_superuser)
#print(a.get_user_permissions())
#print(Usuario.has_perm('change_proyecto',a))

#print(Usuario.get_all_permissions(a))
