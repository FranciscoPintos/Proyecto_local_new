# Generated by Django 3.2.6 on 2021-09-11 19:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('us', '0002_auto_20210911_1411'),
    ]

    operations = [
        migrations.AlterField(
            model_name='us',
            name='estado',
            field=models.IntegerField(choices=[(1, 'To Do'), (2, 'Doing'), (3, 'QA'), (4, 'Done')], default=1),
        ),
    ]
