from django import forms
from django.http import request

from usuario.models import Usuario
from sprint.models import *




class Proyecto_forms(forms.ModelForm):
    class Meta:
        model = Proyecto
        fields = ['name']

    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)
        #self.fields["user"].queryset= Miembro.objects.filter(rol__project_id= self.kwargs['pk'])










