#librerías para views

from django.urls import path,include
from loginSSO import  views

from django.views.generic import TemplateView
from django.contrib.auth.views import LogoutView

urlpatterns = [
        # Paths de views
        path('', TemplateView.as_view(template_name="login.html"),name='login'),
        path('loginSSO/pantalla', TemplateView.as_view(template_name="pantalla.html"),name='pantalla'),
        path('accounts/', include('allauth.urls')),
        path('logout', LogoutView.as_view()),

]

#96128541178-8hkdejl0g62hiurv8a71ah99uvls9up6.apps.googleusercontent.com
#HZaQQ9N-W__8oaltWtQ_xquG