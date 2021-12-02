from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.http import JsonResponse, HttpResponseRedirect, request, HttpResponseServerError
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, View, TemplateView
from django.shortcuts import render, HttpResponse, get_object_or_404,redirect
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

    def get_context_data(self, **kwargs):
        context = super(Proyectos_view, self).get_context_data(**kwargs)
        FormularioProyecto = Proyecto_forms()
        #FormularioProyecto.fields["proyectos"].queryset = Proyecto.objects.all()

        context['form'] =FormularioProyecto
        return context

    def post(self, request, *args, **kwargs):
        print('post', self.request.POST['proyectos'])
        # self.object = self.get_object
        form = Proyecto_forms(self.request.POST)

        return redirect('listus',self.request.POST['proyectos'])


class ProductBacklog_Reporte_view(ListView):
    model = Us
    template_name = 'ProductBacklog_reporte.html'

    # def get_success_url(self):
    #     Proyecto = self.kwargs['pk']
    #     Sprint = self.kwargs['sp_pk']
    #     return reverse_lazy('sprintKanban', kwargs={'pk': Proyecto, 'sp_pk': Sprint})

    def get_context_data(self, **kwargs):
        context = super(ProductBacklog_Reporte_view, self).get_context_data(**kwargs)
        project = Proyecto.objects.get(pk=self.kwargs['pk'])
        us = Us.objects.filter(project=self.kwargs['pk'])
        context['Us'] = listar_us(project)
        context['Proyecto'] = project
        print(context)
        return context
def listar_us(pk):
    us = Us.objects.filter(project=pk.id)
    list=[]
    for i in us:
        list.append({'Nombre': i.name,'Estado':i.get_estado()})
    return list


class Sprint_view(ListView):
    model = Sprint
    template_name = 'listar_sprint.html'

    def get_context_data(self, **kwargs):
        context = super(Sprint_view, self).get_context_data(**kwargs)
        FormularioProyecto = Proyecto_forms()
        context['form'] =FormularioProyecto
        return context

    def post(self, request, *args, **kwargs):
        if request.is_ajax():
            data={}
            try:
                data=[]
                for i in Sprint.objects.filter(proyecto_id=request.POST['pk']):
                    data.append({'id':i.id,'Nombre':i.name})
                print(data)
            except Exception as e:
                data['error']=str(e)
            return JsonResponse(data,safe=False)
        else:
            print(request.POST)
        return redirect('listsprint')
