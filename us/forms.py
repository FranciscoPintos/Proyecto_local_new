from django import forms
from usuario.models import Usuario
from us.models import *


class crearUsForm(forms.ModelForm):
    class Meta:
        model = Us
        fields = ['name','descripcion','dificultad','estado']
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del User Story',
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                }
            ),
            'estado': forms.Select(),
        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)

class editUsForm(forms.ModelForm):
    class Meta:
        model = Us
        fields = ['name','descripcion','dificultad','estado']
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del User Story',
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                }
            ),
            'estado': forms.Select(),
        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)


# class viewUsForm(forms.ModelForm):
#     class Meta:
#         model = Us
#         fields = ['name','descripcion','dificultad','estado']
#     def __init__(self,*args,**kwargs):
#         super().__init__(*args,**kwargs)
