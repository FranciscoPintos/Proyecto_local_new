from django import forms
from django.http import request

from sprint.models import Sprint
from sprintPlanning import  *
from sprintPlanning.models import SprintPlanning
from us.models import Us


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
class tercerpasoplanificarSprint(forms.ModelForm):
    """
    Formulario para definir nombre, inicio y fin de un Sprin
    """
    class Meta:
        model = Sprint
        fields = '__all__'
        exclude = ['proyecto', 'estado', 'fecha_incio', 'fecha_fin', 'name']
        labels = {
            'us': 'User Story',

        }
        widgets = {
            'us': forms.CheckboxSelectMultiple()
        }
class PlanificarUs(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude = ['id', 'estado', 'activo', 'project']
        labels = {
            'name': 'Nombre',
            'descripcion': 'Descripción',
            'storypoints': 'Story Points',
            'user': 'Nombre del miembro'
        }
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'class': 'form-control'
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                    'rows': 3,
                    'cols': 3,
                    'class': 'form-control'
                }
            ),
        }
    storypoints= forms.IntegerField(required=True)
    user = forms.ChoiceField(required=True)
