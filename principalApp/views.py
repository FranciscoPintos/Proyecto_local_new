from django.shortcuts import render, HttpResponse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.contrib.auth.decorators import login_required


# Create your views here.
@login_required(login_url='login')
def inicioview(request):
    user = request.user
    perm_proyecto_ver = user.has_perm('project_view')
    perm_roles_ver = user.has_perm('roles_view')
    context = {
        'perm_proyectos_ver': perm_proyecto_ver,
        'perm_roles_ver': perm_roles_ver,
    }
    return render(request, 'inicio.html', context=context)

def baseview(request):
    return render(request, 'base.html', context=context)

class calendar(TemplateView):
        template_name = 'calendar.html'

def pr(request):
    return render(request, "principalApp/pr.html")
