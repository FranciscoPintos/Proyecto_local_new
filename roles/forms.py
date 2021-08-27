from django import forms

from roles.models import *


class crearRolForm(forms.ModelForm):
    class Meta:
        model = Rol
        fields = ['rol','permisos']
        widgets = {
            'rol': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese Nombre del Rol',
                }
            ),
            'permisos': forms.CheckboxSelectMultiple(),

        }
