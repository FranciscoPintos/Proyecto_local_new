# Generated by Django 3.2.6 on 2021-10-24 18:45

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('us', '0001_initial'),
        ('sprint', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='sprint',
            name='us',
            field=models.ManyToManyField(blank=True, to='us.Us'),
        ),
    ]
