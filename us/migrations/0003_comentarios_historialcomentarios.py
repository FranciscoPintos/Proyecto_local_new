# Generated by Django 3.2.6 on 2021-09-20 07:37

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('project', '0002_proyecto_creator'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('us', '0002_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comentarios',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('comentarios', models.CharField(max_length=2000)),
                ('creador', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('project', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='project.proyecto')),
                ('us', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='us.us')),
            ],
            options={
                'verbose_name': 'Comentarios',
                'db_table': 'comentarios',
                'ordering': ['id', 'creador'],
                'permissions': (('add_comment', 'Can add Us to Product Backlog'), ('view_comment', 'Can view Us to Product Backlog'), ('delete_comment', 'Can delete Us to Product Backlog'), ('modify_comment', 'Can modify comment')),
            },
        ),
        migrations.CreateModel(
            name='HistorialComentarios',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comentarios', models.CharField(max_length=2000, verbose_name='Comentario')),
                ('comment', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='us.comentarios')),
                ('creador', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('project', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='project.proyecto')),
                ('us', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='us.us')),
            ],
        ),
    ]
