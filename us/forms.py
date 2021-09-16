from django import forms
from usuario.models import Usuario
from us.models import *


class crearUsForm(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude=['project','estado','user']
        labels = {
            'name': 'Nombre',
            'descripcion': 'Descripción',
        }
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del User Story',
                    'class': 'form-control'
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                    'rows': 3,
                    'cols': 3,
                    'class':'form-control'
                }
            ),
            'dificultad': forms.Select(
                attrs={
                    'class': 'form-control'
                }
            ),
            'project': forms.Select(
                attrs={
                    'class': 'form-control',

                }
            ),

        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)



class editUsForm(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude = ['project', 'estado', 'user']
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