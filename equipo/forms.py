from django import forms
from equipo.models import Equipo


class CrearEquipo(forms.ModelForm):
    """
    Formulario de creación de Equipo
    """
    class Meta:
        model = Equipo
        fields = '__all__'
        exclude = ['sprint','capacidad']
        widgets = {
            'miembros': forms.CheckboxSelectMultiple(
                attrs={
                    'class': 'form-control'
                }
            ),

        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
