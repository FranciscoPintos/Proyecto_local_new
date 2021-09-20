from django.contrib.auth.models import Permission
from django.db import models
from project.models import Proyecto
from usuario.models import Usuario


class RolProyecto(models.Model):# Member
    project = models.ForeignKey(Proyecto, on_delete=models.CASCADE, null=True)# Para saber a que proyecto pertenece
    name = models.CharField(max_length=60,) #Nombre del Rol
    permisos = models.ManyToManyField(Permission) # Permisos que tiene ese rol

    def list_permissions(self):
        return self.permisos.filter()

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

    def has_permission(self, new): # Para buscar si existe ese permiso en mi rol con un objecto
        for i in self.permisos.all():
            if i == new:
                return True
        return False

    def has_permission_str(self, new):# Para buscar si existe ese permiso en mi rol con una cadena
        for i in self.permisos.all():
            if i.codename == new:
                return True
        return False

    def view_permission(self): # Retorna la lista entera de permisos (no sirve)
        return self.permisos

    def view_all_permission(self):# Retorna todos los permisos de un rol
        return self.permisos.all()

    def __str__(self):
        return self.name.__str__()

    class Meta:
        db_table = 'rol_proyecto'


class Miembro(models.Model):# Meal
    user = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    rol = models.ForeignKey(RolProyecto, on_delete=models.CASCADE, null=True)
    horaTrabajo = models.IntegerField()
    activo= models.BooleanField(default=True)
    class Meta:
        db_table= 'miembros'

   # def retorna_permisos_especifico(self):# Para que rectone permisos especifico se debe agregar un parametro a la función
     #   return self.objects.filter(RolProyecto__permisos__icontains='Rol')

    def __str__(self):
        return self.user.first_name + ', ' + self.user.email
 
    def has_perm(self, perm, obj=None):
        if self.rol == None:
            return False
        else:
            for i in self.rol.list_permissions():
                if i.codename == perm:
                    return True
            return False
