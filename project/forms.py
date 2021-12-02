from datetime import datetime

from django import forms
from django.contrib.auth.models import Permission
from django.core.exceptions import ValidationError
from django.forms import ModelForm
from project.models import Proyecto
from roles.forms import Rol


class ProyectoForm(forms.ModelForm):

    class Meta:
        model = Proyecto
        fields = [
            'name',
            'fecha_inicio',
            'fecha_fin',
            'creator'
        ]
        labels = {
            'name': 'Nombre',
            'fecha_inicio': 'Fecha de inicio',
            'fecha_fin': 'Fecha de finalización',
            'creator': 'Scrum Master'
        }
        widgets = {
            'name': forms.TextInput(attrs={'type': 'text'}),
            'fecha_inicio': forms.TextInput(attrs={'type': 'date','class': 'form-control  datetimepicker'}),
            'fecha_fin': forms.TextInput(attrs={'type': 'date','class': 'form-control  datetimepicker'}),
        }


class ProyectoFormIniciado(forms.ModelForm):

    class Meta:
        model = Proyecto
        fields = [
            'name',
            'fecha_inicio',
            'fecha_fin',
            'creator'
        ]
        labels = {
            'name': 'Nombre',
            'fecha_inicio': 'Fecha de inicio',
            'fecha_fin': 'Fecha de finalización',
            'creator': 'Scrum Master',
        }
        widgets = {
            'name': forms.TextInput(attrs={'type': 'text', 'readonly': 'readonly'}),
            'fecha_inicio': forms.TextInput(attrs={'type': 'date','class': 'form-control  datetimepicker', 'readonly': 'readonly'}),
            'fecha_fin': forms.TextInput(attrs={'type': 'date','class': 'form-control  datetimepicker'}),
        }

class CreateProyectoForm(ModelForm):
    class Meta:
        model = Proyecto
        fields = ['name', 'estado','fecha_inicio','fecha_fin']
        name = forms.CharField()
        fecha_inicio = forms.DateField(required=False)

