# Generated by Django 3.2.6 on 2021-10-09 02:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('sprint', '0001_initial'),
        ('equipo', '0002_equipo_miembros'),
    ]

    operations = [
        migrations.AddField(
            model_name='equipo',
            name='sprint',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='sprint.sprint'),
        ),
    ]
