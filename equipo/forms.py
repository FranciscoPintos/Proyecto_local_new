from django import forms
from equipo.models import Equipo


class CrearEquipo(forms.ModelForm):
    """
    Formulario de creación de Equipo
    """
    class Meta:
        model = Equipo
        fields = '__all__'
        exclude=['sprint','capacidad']
        widgets = {
            'miembros': forms.CheckboxSelectMultiple(),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)



class EditarEquipoForm(forms.ModelForm):
    """
    Formulario de creación de Equipo
    """
    class Meta:
        model = Equipo
        fields = '__all__'
        exclude = ['sprint', 'capacidad']

        widgets = {
            'miembros': forms.CheckboxSelectMultiple(),
        }


    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)