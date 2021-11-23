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
            'fecha_incio': forms.TextInput(attrs={'type': 'date','class': 'form-control  datetimepicker'}),
            'fecha_fin': forms.TextInput(attrs={'type': 'date','class': 'form-control  datetimepicker'}),

        }

class tercerpasoplanificarSprint(forms.ModelForm):
    """
    Formulario para definir nombre, inicio y fin de un Sprin
    """

    def __init__(self, *args, **kwargs):
        """ Grants access to the request object so that only members of the current user
        are given as options"""

        self.request = kwargs.pop('request')
        super(tercerpasoplanificarSprint, self).__init__(*args, **kwargs)
        self.fields['us'].queryset = Us.objects.filter(project_id=self.request, estado=1, activo=True).order_by('-prioridad')

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


class planificacionUS_Scrum(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude = ['id', 'estado', 'activo', 'project', 'storypoints', 'estimaciondesarrollador']
        labels = {
            'name': 'Nombre',
            'descripcion': 'Descripción',
            'estimacionscrum': 'Estimación en horas',
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
    estimacionscrum= forms.IntegerField(required=True)
    #user = forms.ChoiceField(required=True)
class estimarUS_desarrollador(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude = ['id', 'estado', 'activo', 'project','user', 'etiqueta', 'prioridad']
        labels = {
            'name': 'Nombre',
            'descripcion': 'Descripción',
            'estimaciondesarrollador': 'Estimación en horas',
        }
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'readonly': 'readonly'
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                    'rows': 3,
                    'cols': 3,
                    'class': 'form-control',
                    'readonly': 'readonly'
                }
            ),
            'storypoints': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'readonly': 'readonly'
                }
            ),
            'estimacionscrum': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'readonly': 'readonly'
                }
            ),
        }
    estimaciondesarrollador= forms.IntegerField(required=True)