from django.contrib import admin
from usuario.models import *
from roles.models import *
# Register your models here.
admin.site.register(Usuario)
admin.site.register(Rol)
admin.site.register(Permission)