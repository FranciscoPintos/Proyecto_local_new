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
        ]
        labels = {
            'name': 'Nombre',
            'fecha_inicio': 'Fecha de inicio',
            'fecha_fin': 'Fecha de finalización',
            'creator': 'Scrum Master'
        }
        widgets = {
            'name': forms.TextInput(attrs={'type': 'text'}),
            'fecha_inicio': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'fecha_fin': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
        }

class CreateProyectoForm(ModelForm):
    class Meta:
        model = Proyecto
        fields = ['name', 'estado','fecha_inicio','fecha_fin']
        name = forms.CharField()
        fecha_inicio = forms.DateField(required=False)

