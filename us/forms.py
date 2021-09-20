from django import forms
from django.http import request

from usuario.models import Usuario
from us.models import *



#definicion del formulario de creacion de comentario
class FormularioAgregarComentarios(forms.ModelForm):
    class Meta:
        model = Comentarios
        fields = ['comentarios']
        labels = {
            'comentarios': 'Contenido del Comentario'
        }
        widgets = {
            'comentarios': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese aquí su comentario sobre del US',
                    'rows': 3,
                    'cols': 3,
                    'class':'form-control'
                }
            )
        }

    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)

class crearUsForm(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude=['project','estado', 'activo']
        labels = {
            'name': 'Nombre',
            'descripcion': 'Descripción',
        }
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del User Story',
                    'class': 'form-control'
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                    'rows': 3,
                    'cols': 3,
                    'class':'form-control'
                }
            ),
            'dificultad': forms.Select(
                attrs={
                    'class': 'form-control'
                }
            ),
            'project': forms.Select(
                attrs={
                    'class': 'form-control',

                }
            ),

        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)
        #self.fields["user"].queryset= Miembro.objects.filter(rol__project_id= self.kwargs['pk'])



class editUsForm(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude = ['project', 'activo']
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del User Story',
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                }
            ),
            'estado': forms.Select(),
        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)


class crearUsProductForm(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude=['project', 'estado', 'activo', 'user', 'storypoints']
        labels = {
            'name': 'Nombre',
            'descripcion': 'Descripción',
        }
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del User Story',
                    'class': 'form-control'
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                    'rows': 3,
                    'cols': 3,
                    'class':'form-control'
                }
            ),
            'project': forms.Select(
                attrs={
                    'class': 'form-control',

                }
            ),

        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)
        #self.fields["user"].queryset= Miembro.objects.filter(rol__project_id= self.kwargs['pk'])



class editUsProductForm(forms.ModelForm):
    class Meta:
        model = Us
        fields = '__all__'
        exclude = ['project', 'activo']
        widgets = {
            'name': forms.TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del User Story',
                }
            ),
            'descripcion': forms.Textarea(
                attrs={
                    'placeholder': 'Ingrese descripcion del User Story',
                }
            ),
            'estado': forms.Select(),
        }
    def __init__(self,*args,**kwargs):
        super().__init__(*args,**kwargs)

