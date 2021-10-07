from django import forms
from django.http import request

from usuario.models import Usuario
from sprint.models import *




class crearSprintForm(forms.ModelForm):
    class Meta:
        model = Sprint
        fields = '__all__'
        exclude = ['fecha_incio', 'fecha_fin', 'us']
        labels = {
            'name': 'Nombre',
         }
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del Sprint',
                    'class': 'form-control'
                }
            ),
            'fecha_incio': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'fecha_fin': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),

        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)
        #self.fields["user"].queryset= Miembro.objects.filter(rol__project_id= self.kwargs['pk'])










