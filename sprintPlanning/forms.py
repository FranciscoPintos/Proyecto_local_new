from django import forms
from django.http import request

from sprintPlanning import  *
from sprintPlanning.models import SprintPlanning


class crearSprintPlanningForm(forms.ModelForm):
    """
    Formulario para crear un SprinPlanning
    """
    class Meta:
        model = SprintPlanning
        fields = '__all__'