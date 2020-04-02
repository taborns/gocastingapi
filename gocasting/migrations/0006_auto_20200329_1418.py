# Generated by Django 2.2.1 on 2020-03-29 14:18

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('gocasting', '0005_userinfo_weight'),
    ]

    operations = [
        migrations.CreateModel(
            name='CastInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('age', models.IntegerField()),
                ('height', models.FloatField()),
                ('weight', models.FloatField()),
                ('gender', models.CharField(choices=[('male', 'Male'), ('female', 'Female')], max_length=10)),
                ('profile_picture', models.FileField(upload_to='profiles/')),
                ('facebook', models.URLField()),
                ('instagram', models.URLField()),
                ('twitter', models.URLField()),
                ('phone', models.CharField(max_length=15)),
                ('additional_skills', models.ManyToManyField(related_name='users', to='gocasting.AdditionalSkill')),
                ('city', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='city', to='gocasting.City')),
                ('intersted_in', models.ManyToManyField(related_name='users', to='gocasting.InterestTag')),
                ('languages', models.ManyToManyField(related_name='users', to='gocasting.Language')),
                ('region', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='region', to='gocasting.Region')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='cast', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.DeleteModel(
            name='UserInfo',
        ),
    ]
