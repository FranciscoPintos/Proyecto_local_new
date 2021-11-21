from django import forms
from django.http import request

from tarea.models import Tarea
from usuario.models import Usuario
from us.models import *

class crearTarea(forms.ModelForm):
    class Meta:
        model = Tarea
        fields = '__all__'
        exclude=['ustory','sprimt']
        labels = {
            'horas': 'Horas trabajadas',
            'descripcion': 'Descripción',
            'fecha:creacion': 'Fecha de realizacion',
        }
        widgets = {
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                    'rows': 3,
                    'cols': 3,
                    'class':'form-control'
                }
            ),
            'fecha_creacion': forms.TextInput(attrs={'type': 'date', 'class': 'form-control  datetimepicker'}),
        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)

class editarTarea(forms.ModelForm):
    class Meta:
        model = Tarea
        fields = '__all__'
        exclude=['ustory','sprimt']
        labels = {
            'horas': 'Horas',
            'descripcion': 'Descripción',
            'fecha:creacion': 'Fecha de realizacion',
        }
        widgets = {
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                    'rows': 3,
                    'cols': 3,
                    'class':'form-control'
                }
            ),
            'fecha_creacion': forms.TextInput(attrs={'type': 'date', 'class': 'form-control  datetimepicker'}),
        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)
