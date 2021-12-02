from django import forms
from django.http import request

from usuario.models import Usuario
from sprint.models import *
from project.models import *



class Proyecto_forms(forms.Form):
    proyectos = forms.ModelChoiceField(queryset=Proyecto.objects.all(), widget=forms.Select(attrs={
        'class': 'form-control'
    }))
    Sprints = forms.ModelChoiceField(queryset=Sprint.objects.none(), widget=forms.Select(attrs={
        'class': 'form-control'
    }))


class Sprint_forms(forms.Form):
    Sprints = forms.ModelChoiceField(queryset=Sprint.objects.all(),widget=forms.Select(attrs={
        'class':'form-control'
    }))











