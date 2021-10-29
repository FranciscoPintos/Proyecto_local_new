from django.contrib.auth.models import User, Group, Permission
from django.contrib.contenttypes.models import ContentType
from django.db import models

# Create your models here.
from datetime import datetime

from django.forms import model_to_dict


class Rol(models.Model):
    id = models.AutoField(primary_key=True)
    rol = models.CharField('Rol', max_length=50, unique=True)
    permisos = models.ManyToManyField(Permission, blank=True)

    def __str__(self):
        return '{}'.format(self.rol)

    def add_permission_id(self, new):
        self.permisos.add(Permission.objects.get(id=new))

    def toJSON(self):
        item = model_to_dict(self)
        return item

    def list_permissions(self):
        return self.permisos.filter()

    class Meta:
        verbose_name = 'Rol'
        verbose_name_plural = 'Roles'
        db_table = 'roles'
        ordering = ['id']

    # def save(self, *args, **kwargs):
    #     if not self.id:
    #         super().save(*args, **kwargs)
    #         # new_group, created_group = Group.objects.get_or_create(name=f'{self.rol}')
    #         # if created_group:
    #             # new_group.permissions.set(permissions_list)
    #             # new_group.permissions.set(self.perms.id)
    #     else:
    #         print('aca si')


# Mouse herramienta para más adelante
# def save(self, *args, **kwargs):
#       permisos_defect = ['add', 'change', 'delete', 'view']
#       if not self.id:
#           new_group, created_group = Group.objects.get_or_create(name=f'{self.rol}')
#           for perms in permisos_defect:
#               permisos, created_perms = Permission.objects.update_or_create(
#                   name=f'Can {perms} {self.rol}',
#                   content_type=ContentType.objects.get_for_model(Rol),
#                   codename=f'{perms}_{self.rol}'
#               )
#               if created_group:
#                   new_group.permissions.add(permisos.id)
#           super().save(*args, **kwargs)
#       else:
#           rol_antiguo = Rol.objects.filter(id=self.id).values('rol').first()
#           if rol_antiguo['rol'] == self.rol:
#               super().save(*args, **kwargs)
#           else:
#               Group.objects.filter(name=rol_antiguo['rol']).update(name=f'{self.rol}')
#               for perms in permisos_defect:
#                   Permission.objects.filter(codename=f"{perms}_{rol_antiguo['rol']}").update(
#                       codename=f'{perms}_{self.rol}',
#                       name=f'Can{perms}{self.rol}'
#                   )
#               super().save(*args, **kwargs)
