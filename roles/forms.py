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
            'permisos': forms.CheckboxSelectMultiple()
        }


class editRolForm(forms.ModelForm):
    class Meta:
        model = Rol
        fields = ['rol','permisos']
        widgets = {
            'rol': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese Nombre del Rol',
                }
            ),
            'permisos': forms.CheckboxSelectMultiple()

        }

# class deleteRolForm(forms.ModelForm):
#     class Meta:
#         model = Rol
#         fields = ['rol']
#         widgets = {
#             'rol': forms.CheckboxSelectMultiple(),
#         }
#
