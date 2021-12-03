from django.db import models
from django import forms


# Create your models here.


class holidaytime(models.Model):
    holiday_date = models.DateField()


class HolidayTimeForm(forms.Form):
    holiday_date = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'datepicker'
    }))



