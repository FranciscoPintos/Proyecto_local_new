# Generated by Django 3.2.6 on 2021-09-03 04:08

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Rol',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('rol', models.CharField(max_length=50, unique=True, verbose_name='Rol')),
                ('permisos', models.ManyToManyField(blank=True, to='auth.Permission')),
            ],
            options={
                'verbose_name': 'Rol',
                'verbose_name_plural': 'Roles',
                'ordering': ['id'],
            },
        ),
    ]
