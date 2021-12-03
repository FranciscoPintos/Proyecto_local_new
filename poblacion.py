import os
import datetime
import django


# Identificamos la ubicacion del archivo settings del proyecto
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Proyecto.settings")

# cargamos la configuracion de django
django.setup()

from django.contrib.auth.models import Permission
# importamos los modelos del proyecto
from equipo.models import Equipo
from miembros.models import Miembro, RolProyecto
# from notificacion.models import Notificacion
# revisar el de principalApp
from project.models import Proyecto
from roles.models import Rol
from sprint.models import Sprint
from sprintPlanning.models import SprintPlanning
from tarea.models import Tarea, HistorialTarea
from us.models import Us, HistorialUs, Comentarios, HistorialComentarios
from usuario.models import UsuarioManager, Usuario


# lista de permisos con su id
# select * from auth_permission;
# select * from roles;
# muestra los roles que se han creado Scrum Master por ejemplo
# select * from roles_permisos;
# acá estan los numeros de permisos

# **********************************************************************************
# *************************CREACION DEL ROL DE SCRUM MASTER*************************
# **********************************************************************************
Rol.objects.create(
    #id = 1,
    rol = "Scrum Master"
)
# asignacion de permisos para el rol de Scrum Master
# traemos el objeto Rol con id 1 que pertenece al Scrum Master
Rol_1 = Rol.objects.get(id=1)
# le agregamos los permisos necesarios que van desde el permiso con ID 45 hasta el 117
for i in range(45, 118):
    Rol_1.add_permission_id(i)
# *******************************************************************************
# *************************CREACION DEL ROL SIN PERMISOS*************************
# *******************************************************************************
Rol.objects.create(
    #id = 2,
    rol = ""
)


# **********************************************************************************
# *************************ASIGNACION DEL ROL DE SCRUM MASTER***********************
# **********************************************************************************
# PRIMER USER LOGUEADO DEBE SER SUPERUSER
# SCRUM MASTER DEBE SER EL SEGUNDO USUARIO LOGUEADO
user_2 = Usuario.objects.get(id=2)
# le agregamos el ID del rol SCRUM MASTER
user_2.add_rol(Rol.objects.get(id=1))

# EL TERCER USUARIO LOGUEADO TAMBIEN DEBE SER SCRUM MASTER
user_3 = Usuario.objects.get(id=3)
# le agregamos el ID del rol SCRUM MASTER
user_3.add_rol(Rol.objects.get(id=1))

# ***************************************************************************
# *************************CREACION DE LOS PROYECTOS*************************
# ***************************************************************************
# SCRUM 1 (DE ID 2) PARA PROYECTO 1
Proyecto.objects.create(
    #id = 1,
    name = "Proyecto_1",
    creator = Usuario.objects.get(id=2),
    fecha_inicio = datetime.date(2021, 10, 29),
    fecha_fin = datetime.date(2021, 12, 29),
    active = True,
    estado = "E"
).save()
# SCRUM 2 (DE ID 3) PARA PROYECTO 2
Proyecto.objects.create(
    #id = 2,
    name = "Proyecto_2",
    creator = Usuario.objects.get(id=3),
    fecha_inicio = datetime.date(2021, 10, 29),
    fecha_fin = datetime.date(2021, 12, 25),
    active = True,
    estado = "E"
).save()


# ***************************************************************************
# ***********************CREACION DE ROLES DE PROYECTO***********************
# ***************************************************************************
# se agrega el rol de desarrollador al proyecto 1
RolProyecto.objects.create(
    #id = 1,
    project = Proyecto.objects.get(id=1),
    name = "Desarrollador"
)
# se agregan los permisos para el desarrollador
Rol_P = RolProyecto.objects.get(id=1)
Rol_P.add_pemission(28)
Rol_P.add_pemission(52)
# view proyecto
Rol_P.add_pemission(60)
# view us to product backlog
Rol_P.add_pemission(74)
# view us
Rol_P.add_pemission(88)
# view tarea
Rol_P.add_pemission(101)
# view etiqueta
Rol_P.add_pemission(105)
# view sprint
Rol_P.add_pemission(109)
# view equipo
Rol_P.add_pemission(113)
# view sprint planning
Rol_P.add_pemission(117)


# se agrega el rol de desarrollador al proyecto 2
RolProyecto.objects.create(
    #id = 2,
    project = Proyecto.objects.get(id=2),
    name = "Desarrollador"
)
# se agregan los permisos para el desarrollador
Rol_P = RolProyecto.objects.get(id=2)
Rol_P.add_pemission(28)
Rol_P.add_pemission(52)
# view proyecto
Rol_P.add_pemission(60)
# view us to product backlog
Rol_P.add_pemission(74)
# view us
Rol_P.add_pemission(88)
# view tarea
Rol_P.add_pemission(101)
# view etiqueta
Rol_P.add_pemission(105)
# view sprint
Rol_P.add_pemission(109)
# view equipo
Rol_P.add_pemission(113)
# view sprint planning
Rol_P.add_pemission(117)

# ***************************************************************************
# **********************AGHREGAR A LOS DESARROLLADORES***********************
# ***************************************************************************
# al primer desarrollador se le agrega en el proyecto numero 1
Miembro.objects.create(
    user = Usuario.objects.get(id=4),
    rol = RolProyecto.objects.get(project_id=1, name="Desarrollador"),
    horaTrabajo = 20,
    activo = True
)
# al segundo desarrollador se le agrega en el proyecto numero 2
Miembro.objects.create(
    user = Usuario.objects.get(id=5),
    rol = RolProyecto.objects.get(project_id=2, name="Desarrollador"),
    horaTrabajo = 30,
    activo = True
)

# ***************************************************************************
# **********************ASIGNAR EL ROL DE DESARROLLADOR**********************
# ***************************************************************************
# asignacion del rol desarrollador del proyecto 1
user = Miembro.objects.get(id=1)
user.add_rol(RolProyecto.objects.get(project_id=1, name="Desarrollador"))
# asignacion del rol desarrollador del proyecto 2
user = Miembro.objects.get(id=2)
user.add_rol(RolProyecto.objects.get(project_id=2, name="Desarrollador"))


# ***************************************************************************
# **********************ACREACION DE LOS USER STORIES************************
# ***************************************************************************
# user stories del proyecto 1
# 1
Us.objects.create(
    # id = 1,
    name = "User Story 1",
    descripcion = "Esta es la descripcionl user story numero 1",
    prioridad = 5,
    project = Proyecto.objects.get(id=1)
)
# 2
Us.objects.create(
    # id = 2,
    name = "User Story 2",
    descripcion = "Esta es la descripcionl user story numero 2",
    prioridad = 3,
    project = Proyecto.objects.get(id=1)
)
# 3
Us.objects.create(
    # id = 3,
    name = "User Story 3",
    descripcion = "Esta es la descripcionl user story numero 3",
    prioridad = 1,
    project = Proyecto.objects.get(id=1)
)
# 4
Us.objects.create(
    # id = 4,
    name = "User Story 4",
    descripcion = "Esta es la descripcionl user story numero 4",
    prioridad = 2,
    project = Proyecto.objects.get(id=1)
)
# 5
Us.objects.create(
    # id = 5,
    name = "User Story 5",
    descripcion = "Esta es la descripcionl user story numero 5",
    prioridad = 4,
    project = Proyecto.objects.get(id=1)
)
# 6
Us.objects.create(
    # id = 6,
    name = "User Story 6",
    descripcion = "Esta es la descripcionl user story numero 6",
    prioridad = 3,
    project = Proyecto.objects.get(id=1)
)
# 7
Us.objects.create(
    # id = 7,
    name = "User Story 7",
    descripcion = "Esta es la descripcionl user story numero 7",
    prioridad = 1,
    project = Proyecto.objects.get(id=1)
)
# 8
Us.objects.create(
    # id = 8,
    name = "User Story 8",
    descripcion = "Esta es la descripcionl user story numero 8",
    prioridad = 4,
    project = Proyecto.objects.get(id=1)
)
# 9
Us.objects.create(
    # id = 9,
    name = "User Story 9",
    descripcion = "Esta es la descripcionl user story numero 9",
    prioridad = 2,
    project = Proyecto.objects.get(id=1)
)
# 10
Us.objects.create(
    # id = 10,
    name = "User Story 10",
    descripcion = "Esta es la descripcionl user story numero 10",
    prioridad = 4,
    project = Proyecto.objects.get(id=1)
)
# user stories del proyecto 2
# 1
Us.objects.create(
    # id = 1,
    name = "User Story 1",
    descripcion = "Esta es la descripcionl user story numero 1",
    prioridad = 5,
    project = Proyecto.objects.get(id=2)
)
# 2
Us.objects.create(
    # id = 2,
    name = "User Story 2",
    descripcion = "Esta es la descripcionl user story numero 2",
    prioridad = 3,
    project = Proyecto.objects.get(id=2)
)
# 3
Us.objects.create(
    # id = 3,
    name = "User Story 3",
    descripcion = "Esta es la descripcionl user story numero 3",
    prioridad = 1,
    project = Proyecto.objects.get(id=2)
)
# 4
Us.objects.create(
    # id = 4,
    name = "User Story 4",
    descripcion = "Esta es la descripcionl user story numero 4",
    prioridad = 2,
    project = Proyecto.objects.get(id=2)
)
# 5
Us.objects.create(
    # id = 5,
    name = "User Story 5",
    descripcion = "Esta es la descripcionl user story numero 5",
    prioridad = 4,
    project = Proyecto.objects.get(id=2)
)
# 6
Us.objects.create(
    # id = 6,
    name = "User Story 6",
    descripcion = "Esta es la descripcionl user story numero 6",
    prioridad = 3,
    project = Proyecto.objects.get(id=2)
)
# 7
Us.objects.create(
    # id = 7,
    name = "User Story 7",
    descripcion = "Esta es la descripcionl user story numero 7",
    prioridad = 1,
    project = Proyecto.objects.get(id=2)
)
# 8
Us.objects.create(
    # id = 8,
    name = "User Story 8",
    descripcion = "Esta es la descripcionl user story numero 8",
    prioridad = 4,
    project = Proyecto.objects.get(id=2)
)
# 9
Us.objects.create(
    # id = 9,
    name = "User Story 9",
    descripcion = "Esta es la descripcionl user story numero 9",
    prioridad = 2,
    project = Proyecto.objects.get(id=2)
)
# 10
Us.objects.create(
    # id = 10,
    name = "User Story 10",
    descripcion = "Esta es la descripcionl user story numero 10",
    prioridad = 4,
    project = Proyecto.objects.get(id=2)
)


