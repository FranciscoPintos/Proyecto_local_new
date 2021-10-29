from django.contrib.auth.models import Permission
from django.db import models
from project.models import Proyecto
from usuario.models import Usuario


#definicion de modelo de roles de un mimebro de un proyecto
class RolProyecto(models.Model):
    #definicion de campo que contendra el ID del proyecto al cual pertenece
    project = models.ForeignKey(Proyecto, on_delete=models.CASCADE, null=True)
    #definicion de campo que contendra el nombre del rol
    name = models.CharField(max_length=60,)
    #Permisos que tiene el rol
    permisos = models.ManyToManyField(Permission)
    #metodo de la clase RolProyecto que retorna la lista de permisos de un rol en especifico
    def list_permissions(self):
        #En este caso sin un filtro en específico para que retorne TODOS los permisos
        return self.permisos.filter()
    #metodo de la clase RolProyecto que agrega un permiso a un rol
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
    # Para buscar si existe ese permiso en mi rol con un objecto
    def has_permission(self, new): 
        for i in self.permisos.all():
            if i == new:
                return True
        return False
    # Para buscar si existe ese permiso en mi rol con una cadena
    def has_permission_str(self, new):
        for i in self.permisos.all():
            if i.codename == new:
                return True
        return False
    # Retorna la lista entera de permisos (no sirve)
    def view_permission(self): 
        return self.permisos
    # Retorna todos los permisos de un rol
    def view_all_permission(self):
        return self.permisos.all()

    def __str__(self):
        return self.name.__str__()

    class Meta:
        #nombre de la tabla
        db_table = 'rol_proyecto'


#definicion de modelo de Miembro de un proyecto
class Miembro(models.Model):
    #identificacion del ID del usuario miembro de un proyecto
    user = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    #identificacion del ID de la lista de roles que posee 
    rol = models.ForeignKey(RolProyecto, on_delete=models.CASCADE, null=True)
    #campo de horas de trabajo
    horaTrabajo = models.IntegerField()
    #campo del modelo para identificar si un miembro de un proyecto se encuentra activo o no
    activo= models.BooleanField(default=True)
    class Meta:
        #nombre de la tabla
        db_table= 'miembros'

    # def retorna_permisos_especifico(self):# Para que rectone permisos especifico se debe agregar un parametro a la función
        #return self.objects.filter(RolProyecto__permisos__icontains='Rol')

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

    def add_rol(self, new):
        self.rol = new
        self.save()