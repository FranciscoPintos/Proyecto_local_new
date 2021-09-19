from django import forms
from etiqueta.models import Etiqueta


class CrearEtiqueta(forms.ModelForm):
    """
    Formulario de creación de Etiqueta
    """
    class Meta:
        model = Etiqueta
        fields = ['name']
