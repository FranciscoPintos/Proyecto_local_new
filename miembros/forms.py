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
        fields = ['name','permisos']
    name = forms.TextInput(attrs={'type': 'text'})
    permisos = CustomMMCF(
        queryset=Permission.objects.filter(id__gt=46).exclude(id__exact=61),
        widget=forms.CheckboxSelectMultiple
    )
class CrearMiembro(forms.ModelForm):
    class Meta:
        model = Miembro
        fields = ['user','rol','horaTrabajo']

    ch = Usuario.objects.all()
    user = forms.Select(choices=ch)

    horaTrabajo=forms.IntegerField


class deleteMiembro(forms.ModelForm):

    extra_fields = CustomMMCF2(
        queryset=Miembro.objects.filter(activo__exact=True),
        widget=forms.CheckboxSelectMultiple
    )

    class Meta:
        model = Miembro
        fields = []

class modificarProject(forms.ModelForm):
    class Meta:
        model = Proyecto
        fields = [
            'name',
            'fecha_inicio',
            'fecha_fin',
        ]
        labels = {
            'name': 'Nombre',
            'fecha_inicio': 'Fecha de inicio',
            'fecha_fin': 'Fecha de finalización',
        }

        widgets = {
            'name': forms.TextInput(attrs={'type': 'text'}),
            'fecha_inicio': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'fecha_fin': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
        }

class detalleprojecto(forms.ModelForm):
    class Meta:
        model = Proyecto
        fields = ['name','fecha_inicio','fecha_fin', 'estado']

    # name= forms.CharField
    # fecha_inicio= forms.DateField
    # fecha_fin = forms.DateField
    # estado= forms.CharField


class editarRolForm(forms.ModelForm):
    class Meta:
        model = RolProyecto
        fields = ['name','permisos']
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese Nombre del Rol',
                }
            ),
            'permisos': forms.CheckboxSelectMultiple()

        }

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
