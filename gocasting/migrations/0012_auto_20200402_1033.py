# Generated by Django 2.2.1 on 2020-04-02 10:33

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('gocasting', '0011_auto_20200402_1019'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='castinfo',
            name='age',
        ),
        migrations.AddField(
            model_name='castinfo',
            name='birth_date',
            field=models.DateField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
