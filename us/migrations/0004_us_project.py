# Generated by Django 3.2.6 on 2021-09-11 19:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0002_proyecto_creator'),
        ('us', '0003_alter_us_estado'),
    ]

    operations = [
        migrations.AddField(
            model_name='us',
            name='project',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='project.proyecto'),
        ),
    ]