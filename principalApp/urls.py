#librerías para views

from django.urls import path,include
from django.views.generic import TemplateView

from principalApp.views import inicio


urlpatterns = [
        # Paths de views
        path('principalApp/inicio', TemplateView.as_view(template_name="base.html"), name='inicio'),
        path('principalApp/base', TemplateView.as_view(template_name="base.html"), name='base'),

]
