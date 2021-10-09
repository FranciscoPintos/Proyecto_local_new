from django import forms
from django.http import request

from sprint.models import Sprint
from sprintPlanning import  *
from sprintPlanning.models import SprintPlanning


class primerpasoplanificarSprint(forms.ModelForm):
    """
    Formulario para definir nombre, inicio y fin de un Sprin
    """
    class Meta:
        model = Sprint
        fields = '__all__'
        exclude = ['proyecto', 'us', 'estado']
        labels = {
            'name': 'Nombre',
            'fecha_incio': 'Fecha de Inicio',
            'fecha_fin': 'Fecha Fin'
        }
        widgets = {
            'fecha_incio': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'fecha_fin': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),

        }