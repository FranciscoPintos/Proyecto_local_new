# Generated by Django 3.2.6 on 2021-10-11 16:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('equipo', '0006_auto_20211010_1111'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='equipo',
            options={'ordering': ['id'], 'verbose_name': 'Equipo'},
        ),
        migrations.AlterModelTable(
            name='equipo',
            table='equipo',
        ),
    ]