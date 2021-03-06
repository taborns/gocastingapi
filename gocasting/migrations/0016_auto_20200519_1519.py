# Generated by Django 2.2.1 on 2020-05-19 15:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gocasting', '0015_auto_20200402_1953'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='educationhistory',
            options={'ordering': ('start_year', 'end_year')},
        ),
        migrations.AlterModelOptions(
            name='workhistory',
            options={'ordering': ('start_year', 'end_year')},
        ),
        migrations.AddField(
            model_name='agentinfo',
            name='city',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='agents', to='gocasting.City'),
        ),
        migrations.AddField(
            model_name='agentinfo',
            name='company',
            field=models.CharField(default='Simplatec', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='agentinfo',
            name='region',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='agents', to='gocasting.Region'),
        ),
        migrations.AlterField(
            model_name='castinfo',
            name='city',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='casts', to='gocasting.City'),
        ),
        migrations.AlterField(
            model_name='castinfo',
            name='region',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='casts', to='gocasting.Region'),
        ),
    ]
