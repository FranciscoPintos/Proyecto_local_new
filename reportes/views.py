from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.http import JsonResponse, HttpResponseRedirect, request, HttpResponseServerError
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.shortcuts import render, HttpResponse, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.urls import reverse

from reportes.forms import *
from miembros.models import *
# Create your views here.


class reportes_view(ListView):
    model = Proyecto
    template_name = 'reportes.html'

class Proyectos_view(ListView):
    model = Proyecto
    template_name = 'listar_proyectos.html'


class ProductBacklog_Reporte_view(ListView):
    model = Us
    template_name = 'ProductBacklog_reporte.html'

    # def get_success_url(self):
    #     Proyecto = self.kwargs['pk']
    #     Sprint = self.kwargs['sp_pk']
    #     return reverse_lazy('sprintKanban', kwargs={'pk': Proyecto, 'sp_pk': Sprint})

    def get_context_data(self, **kwargs):
        context = super(ProductBacklog_Reporte_view, self).get_context_data(**kwargs)
        project=Proyecto.objects.get(pk=self.kwargs['pk'])
        us=Us.objects.filter(project=self.kwargs['pk'])
        context['Us']=us
        context['Proyecto']=project
        print(context)
        return context

