from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
#from allauth.socialaccount.models import

# Create your models here.


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

        usuario.usuario_administrador = True
        usuario.save()
        return usuario

    def has_perm(self, perm, obj=None):
        return True

class RolSistema(models.Model):
    name = models.CharField(max_length=60)
    permisos = models.ManyToManyField(Permission)

    def add_pemission(self, new):
        self.permisos.add(new)

    """
    Asigna un permiso al rol
    
    Parameters
    ----------
    new: str
    Cadena que representa un permiso con la columna 'codename' de la tabla auth_permission
    """
    def add_pemission_str(self, new):
        self.permisos.add(Permission.objects.get(codename=new))

    def has_permission(self,new):
        for i in self.permisos.all():
            if i == new:
                return True
        return False

    def has_permission_str(self,new):
        for i in self.permisos.all():
            if i.codename == new:
                return True
        return False

    def view_permission(self):
        return self.permisos

    def view_all_permission(self):
        return self.permisos.all()

    def __str__(self):
        return self.name + ' ' + self.permisos.all()

    class Meta:
        db_table = 'rol_sistema'

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
    rol = models.ForeignKey(RolSistema, on_delete=models.CASCADE, blank=True, null=True)
    objects = UsuarioManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email']

    def __str__(self):
        return self.username + ' ' + self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.usuario_administrador

    def add_rol(self, new):
        self.rol = new
        self.save()
