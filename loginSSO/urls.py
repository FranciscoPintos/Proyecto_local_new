#librerías para views

from django.urls import path,include
from loginSSO import  views

from django.views.generic import TemplateView
from django.contrib.auth.views import LogoutView

urlpatterns = [
        # Paths de views
        path('', views.home, name='home'),

        path('loginSSO/',views.pantalla,name='pantalla'),
        path('accounts/', include('allauth.urls')),
        path('logout', LogoutView.as_view()),


]