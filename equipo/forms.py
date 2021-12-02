from django import forms
from equipo.models import Equipo
from miembros.models import Miembro
from sprint.models import Sprint


class CrearEquipo(forms.ModelForm):
    """
    Formulario de creación de Equipo
    """
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request')
        super(CrearEquipo, self).__init__(*args, **kwargs)
        self.fields['miembros'].queryset = Miembro.objects.filter(rol__project_id=self.request).exclude(rol__name="Scrum Master").exclude(rol__name="Product Owner")

    class Meta:
        model = Equipo
        fields = '__all__'
        exclude=['sprint','capacidad']
        widgets = {
            'miembros': forms.CheckboxSelectMultiple(),
        }

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
        self.request = kwargs.pop('request')
        print(self.request)
        super(EditarEquipoForm, self).__init__(*args, **kwargs)
        equipo = Equipo.objects.get(id=self.request)
        us_list_sprint= Sprint.objects.get(id=equipo.sprint.id).us.all()
        miembros_equipo= Miembro.objects.filter(rol__project_id=equipo.sprint.proyecto.id).exclude(rol__name="Scrum Master").exclude(rol__name="Product Owner")

        print(miembros_equipo)
        self.fields['miembros'].queryset = miembros_equipo