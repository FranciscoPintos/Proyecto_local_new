from django import forms
from models import Equipo


class CrearEquipo(forms.ModelForm):
    """
    Formulario de creación de Equipo
    """
    class Meta:
        model = Equipo
        fields = '__all__'
        exclude = ['sprint']
