# Generated by Django 3.2.8 on 2021-10-26 14:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('sprint', '0001_initial'),
        ('us', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='sprint',
            name='us',
            field=models.ManyToManyField(blank=True, to='us.Us'),
        ),
    ]
