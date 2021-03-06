from django.db import models
from django.contrib.auth.models import AbstractUser,UserManager
from django.conf import settings
from ckeditor_uploader.fields import RichTextUploadingField

""" 
^(?:https?:\/\/)?(?:(www\.)|(m\.))?youtu\.?be(?:\.com)?.*?(?:v|list)=(.*?)(?:&|$)
^(?:https?:\/\/)?(?:(www\.)|(m\.))?youtu\.?be(?:\.com)?(?:(?!=).)*\/(.*)$
"""

# Create your models here.
class Language(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return "%s" % self.name

class Region(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return "%s" % self.name

class City(models.Model):
    name = models.CharField(max_length=50)
    region = models.ForeignKey('Region', related_name='cities', on_delete=models.CASCADE)

    def __str__(self):
        return "%s"% self.name 

class InterestTag(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return "%s" % self.name 

class AdditionalSkill(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return "%s" % self.name 
        
class User( AbstractUser ):
    pass 

class CastInfo(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, related_name='cast', on_delete = models.CASCADE)
    birth_date = models.DateField() 
    height = models.FloatField() 
    weight = models.FloatField() 
    gender = models.CharField(max_length=10, choices = (
        ('male', "Male"),
        ('female', "Female")
    ))

    languages = models.ManyToManyField('Language', related_name = 'users')
    additional_skills = models.ManyToManyField('AdditionalSkill', related_name = 'users')
    intersted_in = models.ManyToManyField("InterestTag", related_name='users')

    profile_picture = models.CharField(max_length=150)

    #Adress Information
    region = models.ForeignKey("Region", related_name='casts',  null=True, on_delete=models.SET_NULL)
    city = models.ForeignKey("City", related_name='casts', null=True, on_delete=models.SET_NULL)

    facebook = models.URLField(null=True, blank=True)
    instagram = models.URLField(null=True, blank=True)
    twitter = models.URLField(null=True, blank=True)
    phone = models.CharField(max_length=15)

    class Meta:
        ordering = '-pk',

class AgentInfo(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, related_name='agent', on_delete = models.CASCADE)
    phone = models.CharField(max_length=15)
    company = models.CharField(max_length=100)

    #Adress Information
    region = models.ForeignKey("Region", related_name='agents',  null=True, on_delete=models.SET_NULL)
    city = models.ForeignKey("City", related_name='agents', null=True, on_delete=models.SET_NULL)
    
    balance = models.FloatField(default=0)

    def deposit(self, amount):
        
        if amount > 0:
            self.balance += amount
            self.save() 
            return True 
        
        return False 
        
    def withdraw(self, amount):
        
        if amount > 0 and amount <= self.balance:
            self.balance -= amount
            self.save()
            return True 
            
        return False 

class AgentModel(models.Model):
    agent = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='adress_availables', on_delete=models.CASCADE)
    cast = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='adress_available_for', on_delete=models.CASCADE)
    revealed_at = models.DateTimeField(auto_now_add = True) 

class PictureArea(models.Model):
    picture = models.FileField(upload_to='profiles/')

class PhotoGallery(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='photos', on_delete = models.CASCADE)
    photo = models.FileField(upload_to='gallery/')

class VideoGallery(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='videos', on_delete = models.CASCADE)
    video = models.URLField()

class WorkHistory(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='work_histories', on_delete = models.CASCADE)
    title = models.CharField(max_length=130)
    company = models.CharField(max_length=130)
    start_year = models.IntegerField()
    end_year = models.IntegerField(null=True, blank=True)
    description = models.TextField(blank=True)

    class Meta:
        ordering = 'start_year', 'end_year'

class EducationHistory(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='education_histories', on_delete = models.CASCADE)
    title = models.CharField(max_length=130)
    school = models.CharField(max_length=130)
    start_year = models.IntegerField()
    end_year = models.IntegerField(null=True, blank=True)
    description = models.TextField(blank=True)

    class Meta:
        ordering = 'start_year', 'end_year'


class Job(models.Model):

    title = models.CharField(max_length = 130)
    requirement = RichTextUploadingField() 

    #location 
    region = models.ForeignKey("Region", related_name='jobs',  null=True, on_delete=models.SET_NULL)
    address = models.CharField(max_length = 130)
    gender = models.CharField(max_length = 12, choices = (
        ('all', 'All'),
        ('female', 'Female'),
        ('male', 'Male')
    ))

    start_age = models.IntegerField(default=0)
    end_age = models.IntegerField(default=150)
    payment = models.CharField(max_length = 150)
    closes_on = models.DateField()
    is_open = models.BooleanField(default=True)
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='jobs',  null=True, on_delete=models.SET_NULL)
    created_on = models.DateTimeField(auto_now_add = True)


    def __str__(self):
        return "%s" % (self.title)
    
    def applied_by(self, applicant):
        return self.applications.filter(applicant = applicant).exists()
        
    class Meta:
        ordering = '-created_on',

class Application(models.Model):
    applicant = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='applications',  null=True, on_delete=models.SET_NULL)
    job = models.ForeignKey("Job", related_name='applications',  null=True, on_delete=models.SET_NULL)
    applied_on = models.DateTimeField(auto_now_add = True)

