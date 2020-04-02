from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from gocasting import models 

# Register your models here.
class CastInfoStackedInline(admin.StackedInline):
    model = models.CastInfo
    extra = 1

class CastPhotoGalleryInline(admin.StackedInline):
    model = models.PhotoGallery
    extra = 1

class CastVideoGalleryInline(admin.StackedInline):
    model = models.VideoGallery
    extra = 1

class WorkHistorynline(admin.StackedInline):
    model = models.WorkHistory
    extra = 1

class EducationHistorynline(admin.StackedInline):
    model = models.EducationHistory
    extra = 1

class UserAdmin(BaseUserAdmin):
    inlines = [CastInfoStackedInline, WorkHistorynline, EducationHistorynline, CastPhotoGalleryInline, CastVideoGalleryInline]

class LanguageAdmin(admin.ModelAdmin):
    pass

class RegionAdmin(admin.ModelAdmin):
    pass

class CityAdmin(admin.ModelAdmin):
    pass

class CastAdmin(admin.ModelAdmin):
    pass

class InterestTagAdmin(admin.ModelAdmin):
    pass

class AdditionalSkillAdmin(admin.ModelAdmin):
    pass

admin.site.register(models.User, UserAdmin)
admin.site.register(models.Language, LanguageAdmin)
admin.site.register(models.Region, RegionAdmin)
admin.site.register(models.City, CityAdmin)
admin.site.register(models.InterestTag, InterestTagAdmin)
admin.site.register(models.AdditionalSkill, AdditionalSkillAdmin)