from datetime import datetime

from crum import get_current_request
from django.contrib import messages
from django.http import HttpResponseRedirect, HttpRequest, HttpResponse
from django.shortcuts import redirect
from django.urls import reverse_lazy


class IsSuperuserMixin(object):
    def dispatch(self, request, *args, **kwargs):
        if request.user.is_superuser:
            return super().dispatch(request, *args, **kwargs)
        return redirect('inicio')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['date_now'] = datetime.now()
        return context


class ValidatePermissionRequiredMixin(object):
    permission_required = ''
    url_redirect = None
    def get_perms(self):
        perms = []
        if isinstance(self.permission_required, str):
            perms.append(self.permission_required)
        else:
            perms = list(self.permission_required)
        return perms

    def get_url_redirect(self):
        if self.url_redirect is None:
            return reverse_lazy('login')
        return self.url_redirect
    def dispatch(self, request, *args, **kwargs):
        if request.user.has_perm(self.permission_required):
            return super().dispatch(request,*args,**kwargs)
        return  HttpResponseRedirect(self.get_url_redirect())
        # if request.user.is_superuser:
        #     return super().dispatch(request, *args, **kwargs)
        # if 'group' in request.session:
        #     group = request.session['group']
        #     perms = self.get_perms()
        #     for p in perms:
        #         if not group.permissions.filter(codename=p).exists():
        #             messages.error(request, 'No tiene permiso para ingresar a este módulo')
        #             return HttpResponseRedirect(self.get_url_redirect())
        #     return super().dispatch(request, *args, **kwargs)
        # messages.error(request, 'No tiene permiso para ingresar a este módulo')
        # return HttpResponseRedirect(self.get_url_redirect())