from django import forms
from django.contrib.auth.models import Permission

from miembros.models import RolProyecto, Miembro
from project.models import Proyecto
from usuario.models import Usuario


class CustomMMCF(forms.ModelMultipleChoiceField):
    def label_from_instance(self, Permission):
        return Permission.name


class CustomMMCF2(forms.ModelMultipleChoiceField):
    def label_from_instance(self, Miembro):
        return Miembro

class CrearRol(forms.ModelForm):
    class Meta:
        model = RolProyecto
        fields = ['name','permisos','project']
    name = forms.TextInput(attrs={'type': 'text'})
    permisos = CustomMMCF(
        queryset=Permission.objects.filter(id__gt=46).exclude(id__exact=61),
        widget=forms.CheckboxSelectMultiple
    )
    ch= Proyecto.objects.all()
    project= forms.Select(choices=ch)
class CrearMiembro(forms.ModelForm):
    class Meta:
        model = Miembro
        fields = ['user','rol','horaTrabajo']

    ch = Usuario.objects.all()
    user = forms.Select(choices=ch)
    ch1 = RolProyecto.objects.all()
    rol = forms.Select(choices=ch1)
    horaTrabajo=forms.IntegerField


class deleteMiembro(forms.ModelForm):

    extra_fields = CustomMMCF2(
        queryset=Miembro.objects.filter(activo__exact=True),
        widget=forms.CheckboxSelectMultiple
    )

    class Meta:
        model = Miembro
        fields = []

"""
    project = CustomMMCF2(
        queryset=Proyecto.objects.all(),
        widget=forms.Select
    )
"""
"""
class ProyectoForm(forms.ModelForm):

    class Meta:
        model = Proyecto
        fields = [
            'name',
            'permisos',
            'fecha_fin',
        ]
        labels = {
            'name': 'Nombre',
            'fecha_inicio': 'Permiso de Rol',
            'fecha_fin': 'Fecha de finalización',
        }
        widgets = {
            'name': forms.CharField(),
            'fecha_inicio': forms.DateField(),
            'fecha_fin': forms.DateField(),
        }
"""
