"""Proyecto URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('loginSSO.urls')),
    path('', include('principalApp.urls')),
    path('', include('usuario.urls')),
    path('', include('roles.urls')),
    path('', include('project.urls')),
    path('', include('miembros.urls')),
    path('', include('us.urls')),
    path('', include('tarea.urls')),
    path('', include('etiqueta.urls')),
    path('', include('sprint.urls')),
    path('', include('sprintPlanning.urls')),
    path('', include('equipo.urls')),
    path('', include('reportes.urls')),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
