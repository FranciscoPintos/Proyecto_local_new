from crum import get_current_request
from django.contrib.auth.models import *
from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.forms import model_to_dict



from django.conf import settings
from django.conf.urls.static import static

from django.contrib.auth.models import AbstractUser, BaseUserManager, Permission

#from allauth.socialaccount.models import

# Create your models here.
from roles.models import Rol


class UsuarioManager(BaseUserManager):
    def create_user(self,email, username, names = None, lastname = None, password = None):
        if not email:
            raise ValueError('El usuario debe tener un email')

        usuario = self.model(
            username = username,
            email = self.normalize_email(email),
            names = names,
            lastname = lastname
        )

        usuario.set_password(password)
        usuario.save()
        return usuario

    def create_superuser(self, email, username, names=None, lastname=None, password=None):

        usuario = self.create_user(
            email,
            username=username,
            names=names,
            lastname=lastname,
            password=password
        )

        usuario.is_superuser = True
        usuario.usuario_administrador = True
        usuario.save()
        return usuario

    def has_perm(self, perm, obj=None):
        return True



class Usuario(AbstractUser):

    username = models.CharField('Nombre de usuario', unique=True, max_length=50)
    names = models.CharField('Nombres ', max_length=50, null=True, blank=True)
    lastname = models.CharField('Apellidos ', max_length=50, null=True, blank=True)
    ci = models.CharField(max_length=10,unique=True,  verbose_name='Cedula', null=True, blank=True)
    email = models.CharField(max_length=70, verbose_name='emaill', unique=True)
    fecha_nac = models.DateField(null=True, blank=True)
    fecha_created = models.DateField(null=True, blank=True)
    fecha_deleted = models.DateField(null=True, blank=True)
    usuario_activo = models.BooleanField(default=True, null=True, blank=True)
    usuario_administrador = models.BooleanField(default=False, null=True, blank=True)
    rol = models.ForeignKey(Rol, on_delete=models.CASCADE, blank=True, null=True)

    image = models.ImageField(upload_to='users/%Y/%m/%d', null=True, blank=True)
    objects = UsuarioManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email']

    def __str__(self):
        return self.username + ' ' + self.email

    # def get_image(self):
    #     if self.image:
    #         return '{}{}'.format(MEDIA_URL, self.image)
    #     return '{}{}'.format(STATIC_URL, 'img/avatar.png')

    def has_module_perms(self, app_label):
        return True

    def has_perm(self, perm, obj=None):
        if self.is_superuser:
            print('es super')
            return True
        if self.rol == None:
            return False
        else:
            print('no es super')
            for i in self.rol.list_permissions():
                print(i.codename)
                if i.codename == perm:
                    return True
            return False

    @property
    def is_staff(self):
        return self.is_superuser

    # Funcion toJason Para que funcione la vista - FP
    def toJSON(self):
        item = model_to_dict(self, exclude=['password', 'user_permissions', 'last_login'])
        if self.last_login:
            item['last_login'] = self.last_login.strftime('%Y-%m-%d')
        item['date_joined'] = self.date_joined.strftime('%Y-%m-%d')
        item['full_name'] = self.get_full_name()
        item['permission'] = self.get_all_permissions()
        item['groups'] = [{'id': g.id, 'name': g.name} for g in self.groups.all()]
        return item

    # funcion para obtener un grupo de sesion -FP
    def get_group_session(self):
        try:
            request = get_current_request()
            groups = self.groups.all()
            if groups.exists():
                if 'group' not in request.session:
                    request.session['group'] = groups[0]
        except:
            pass

    # Redefinir el save para asignar el rol al usuario
    # def save(self, *args, **kwargs):
    #     if not self.id:
    #         super().save(*args, **kwargs)
    #         if self.rol is not None:
    #             grupo = Group.objects.filter(name=self.rol.rol).first()
    #             if grupo:
    #                 self.groups.add(grupo)
    #             super().save(*args, **kwargs)
    #     else:
    #         if self.rol is not None:
    #             grupo_ant = Usuario.objects.filter(id=self.id).values('rol__rol').first()
    #             if grupo_ant['rol__rol'] == self.rol.rol:
    #                 super().save(*args, **kwargs)
    #             else:
    #                 grupo_anterior = Group.objects.filter(name=grupo_ant['rol__rol']).first()
    #                 if grupo_anterior:
    #                     self.groups.remove(grupo_anterior)
    #                 new_group = Group.objects.filter(name=self.rol.rol).first()
    #                 if new_group:
    #                     self.groups.add(new_group)
    #                 super().save(*args, **kwargs)
    def add_rol(self, new):
        self.rol = new
        self.save()
