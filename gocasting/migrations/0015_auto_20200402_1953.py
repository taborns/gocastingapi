# Generated by Django 2.2.1 on 2020-04-02 19:53

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('gocasting', '0014_auto_20200402_1812'),
    ]

    operations = [
        migrations.RenameField(
            model_name='agentmodel',
            old_name='model',
            new_name='cast',
        ),
    ]
