from django.contrib.auth.models import User, Group, Permission
from django.contrib.contenttypes.models import ContentType
from django.db import models

# Create your models here.
from datetime import datetime

from django.forms import model_to_dict


class Rol(models.Model):
    id = models.AutoField(primary_key=True)
    rol = models.CharField('Rol', max_length=50, unique=True)
    # perms_choice= ArrayField(
    #     ArrayField( models.CharField(max_length=10),blank=True),
    #     size=8,
    # )
    # permisos= models.CharField(
    #     max_length=2,
    #     choices=perms_choice,
    #     blank=True
    # )
    permisos = models.ManyToManyField(Permission, blank=True)

    def __str__(self):
        return '{}'.format(self.rol)

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Rol'
        verbose_name_plural = 'Roles'
        ordering = ['id']

    def save(self, *args, **kwargs):
        print('entro aca?')
        permisos_defect = ['add', 'change', 'delete', 'view']
        if not self.id:
            new_group, created_group = Group.objects.get_or_create(name=f'{self.rol}')
            for perms in permisos_defect:
                permisos, created_perms = Permission.objects.update_or_create(
                    name=f'Can {perms} {self.rol}',
                    content_type=ContentType.objects.get_for_model(Rol),
                    codename=f'{perms}_{self.rol}'
                )
                if created_group:
                    new_group.permissions.add(permisos.id)
            super().save(*args, **kwargs)
        else:
            rol_antiguo = Rol.objects.filter(id=self.id).values('rol').first()
            if rol_antiguo['rol'] == self.rol:
                super().save(*args, **kwargs)
            else:
                Group.objects.filter(name=rol_antiguo['rol']).update(name=f'{self.rol}')
                for perms in permisos_defect:
                    Permission.objects.filter(codename=f"{perms}_{rol_antiguo['rol']}").update(
                        codename=f'{perms}_{self.rol}',
                        name=f'Can{perms}{self.rol}'
                    )
                super().save(*args, **kwargs)
