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

    #creator = forms.Select(list(Usuario.objects.filter(rol__rol='Scrum Master')))

    #print(list(Usuario.objects.filter(rol__rol__exact='Scrum Master')))



    """
    def clean_fecha_inicio(self):
        data = self.cleaned_data['fecha_inicio']

        # Check date is not in past.
        if data < datetime.date.today():
            raise ValidationError(_('Invalid date - renewal in past'))
        
        # Check date is in range librarian allowed to change (+4 weeks).
        if data > datetime.date.today() + datetime.timedelta(weeks=4):
            raise ValidationError(_('Invalid date - renewal more than 4 weeks ahead'))
        

        # Remember to always return the cleaned data.
        return data
"""
class CreateProyectoForm(ModelForm):
    class Meta:
        model = Proyecto
        fields = ['name', 'estado','fecha_inicio','fecha_fin']
        name = forms.CharField()
        fecha_inicio = forms.DateField(required=False)
    #estado = forms.ModelMultipleChoiceField(
    #    queryset=Permission.objects.all(),
    #    widget=forms.CheckboxSelectMultiple
    #)
