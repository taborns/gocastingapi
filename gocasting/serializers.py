from rest_framework import serializers 
from gocasting import models, constants
from django.db.models import Q
from datetime import date, datetime, timedelta
from django.utils import timezone 
from django.contrib.auth import get_user_model


class PictureAreaSerializer(serializers.ModelSerializer):
    pictureName = serializers.SerializerMethodField()
    
    def get_pictureName(self, obj):
        return obj.picture.name

    class Meta:
        model = models.PictureArea
        fields = "__all__"

class InterestTagSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.InterestTag 
        fields = "__all__"

class LanguageSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Language
        fields = "__all__"

class RegionSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Region 
        fields = "__all__"

class CitySerializer(serializers.ModelSerializer):

    class Meta:
        model = models.City 
        fields = "__all__"
        
class AdditionalSkillSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.AdditionalSkill
        fields = "__all__"

class CastPhotoGallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PhotoGallery
        fields = "__all__"

class PhotoGalleryCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.PhotoGallery
        exclude = "user",

    def save(self, user):
        photoGallery = models.PhotoGallery.objects.create(**self.validated_data, user=user)

        return photoGallery

class PhotoGalleryDestroySerializer(serializers.Serializer):
    photos = serializers.ListField(child=serializers.IntegerField())

    def validate_photos(self, photos):
        user = self.context.get('request').user
        photos = user.photos.filter(pk__in = photos)
        return photos 
    
    def destroy(self):
        photos = self.validated_data.get('photos')
        print("PHOTOS", photos)
        photos.delete() 
        
        
class CastVideoGallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.VideoGallery
        fields = "__all__"

class VideoGalleryCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.VideoGallery
        exclude = "user",

    def save(self, user):
        videoGallery = models.VideoGallery.objects.create(**self.validated_data, user=user)

        return videoGallery

class WorkHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.WorkHistory
        fields = "__all__"
    
    def validate(self, attrs):
        start_year = attrs.get('start_year')
        end_year = attrs.get('end_year')

        if end_year and start_year > end_year:
            raise serializers.ValidationError("The end year has to be greater than the start year")

        return attrs
    

class WorkHistoryCreateSerializer(WorkHistorySerializer):
    class Meta:
        model = models.WorkHistory
        exclude = "user",


    def save(self, user):
        workHistory = models.WorkHistory.objects.create(**self.validated_data, user=user)

        return workHistory


class EducationHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.EducationHistory
        fields = "__all__"

    def validate(self, attrs):
        start_year = attrs.get('start_year')
        end_year = attrs.get('end_year')

        if end_year and start_year > end_year:
            raise serializers.ValidationError("The end year has to be greater than the start year")

        return attrs

class EducationHistoryCreateSerializer(EducationHistorySerializer):
    class Meta:
        model = models.EducationHistory
        exclude = "user",

    def save(self, user):
        educationHistory = models.EducationHistory.objects.create(**self.validated_data, user=user)

        return educationHistory



class AttributeDataSerializer(serializers.Serializer):
    disciplines = InterestTagSerializer(many=True)
    languages = LanguageSerializer(many=True)
    regions = RegionSerializer(many=True)
    cities = CitySerializer(many=True)
    additional_skills = AdditionalSkillSerializer(many=True)

class UserCastReadSerializer(serializers.ModelSerializer):
    
    photos = CastPhotoGallerySerializer(many=True)
    videos = CastVideoGallerySerializer(many=True)
    work_histories = WorkHistorySerializer(many=True)
    education_histories = EducationHistorySerializer(many=True)

    class Meta:
        model = models.User 
        exclude = "is_superuser", "is_staff", 'is_active','groups', 'user_permissions','password'

class CastInfoReadSerializer(serializers.ModelSerializer):
    access_level = serializers.CharField( default = 'private')

    region = RegionSerializer() 
    city = CitySerializer() 
    languages = LanguageSerializer(many=True)
    additional_skills = AdditionalSkillSerializer(many=True)
    intersted_in = InterestTagSerializer(many=True)
    user = UserCastReadSerializer()
    age = serializers.SerializerMethodField()

    def get_age(self, cast):
        today = date.today() 
        age = today.year - cast.birth_date.year - ((today.month, today.day) < (cast.birth_date.month, cast.birth_date.day)) 
    
        return age 

    class Meta:
        model = models.CastInfo
        fields = "__all__"

class UserCastPublicReadSerializer(UserCastReadSerializer):
    access_level = serializers.CharField( default = 'private')

    class Meta:
        model = models.User 
        exclude = "is_superuser", "email", "is_staff", 'is_active','groups', 'user_permissions','password'
 
class CastInfoPublicReadSerializer(CastInfoReadSerializer):

    access_level = serializers.CharField( default = 'public')
    user = UserCastPublicReadSerializer()

    class Meta:
        model = models.CastInfo
        exclude = "phone", "instagram", "facebook", "twitter"

class SearchCastSerializer(serializers.Serializer):

    age = serializers.ListField( required=False, max_length = 2, min_length = 2, child=serializers.IntegerField())
    height = serializers.ListField( required=False, max_length = 2, min_length = 2, child=serializers.FloatField())
    weight = serializers.ListField( required=False, max_length = 2, min_length = 2, child=serializers.FloatField())
    gender = serializers.ChoiceField(required=False, default='all', choices = (('all', 'All'), ('male', "Male"), ('female', "Female")))
    name = serializers.CharField(allow_blank=True, required=False)
    discipline = serializers.IntegerField(required=False)
    
    def validate_age(self, age_range):
        start_age = age_range[0]
        end_age = age_range[1]

        start_birth_date = timezone.now() - timedelta(days = start_age * 365)
        end_birth_date = timezone.now() - timedelta(days = end_age * 365)

        return [start_birth_date, end_birth_date]

    def getAll(self, attrs):
        queryset = models.CastInfo.objects.all()
        birthdate = attrs.get('age')
        height = attrs.get('height')
        weight = attrs.get('weight')
        gender = attrs.get('gender', 'all')
        name = attrs.get('name')
        discipline = attrs.get('discipline', -1)

        if discipline and discipline != -1:
            queryset = queryset.filter(intersted_in__pk__contains = discipline)

        if birthdate:
            queryset = queryset.filter(birth_date__gte = birthdate[1], birth_date__lte=birthdate[0])
        
        if height:
            queryset = queryset.filter(height__lte = height[1], height__gte = height[0])
        
        if weight:
            queryset = queryset.filter(weight__lte = weight[1], weight__gte = weight[0])
        
        if gender and gender != 'all':
            queryset = queryset.filter(gender = gender)
        
        if name:
            queryset = queryset.filter( Q(user__first_name__icontains = name ) | Q(user__last_name__icontains = name) )
        
        return queryset

class UserRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User 
        fields = "username", "first_name", "last_name", 'email', 'password'
        extra_kwargs = {
            'first_name': {'required': True, "allow_blank" : False},
            'last_name': {'required': True, "allow_blank" : False},
        }


class UserChangePasswordSerializer(serializers.ModelSerializer):

    oldpass = serializers.CharField(write_only = True)

    class Meta:
        model = models.User 
        fields = 'password', 'oldpass'
    
    def validate_oldpass(self, oldpass):
        user = self.context.get('request').user

        if not user.check_password( oldpass ):
            raise serializers.ValidationError("Invalid old password")

        return oldpass

    def update(self, instance, validated_data):
        instance.set_password( validated_data.get('password'))
        instance.save()
        return instance



class CastRegisterSerializer(serializers.ModelSerializer):
    user = UserRegisterSerializer()
    class Meta:
        model = models.CastInfo
        fields = '__all__'
    
    def validate_phone(self, telephone):
        import re
        match = re.match('(0|\+251)(9\d{8})', telephone)
        if match:
            return "+251%s" %(match.group(2))
        
        raise serializers.ValidationError('Invalid phone number provided')

    def save(self):
        validated_data = self.validated_data.copy()
        languages = validated_data.pop('languages')
        intersted_in = validated_data.pop('intersted_in')
        additional_skills = validated_data.pop('additional_skills')
        user_data = validated_data.pop('user')
        user = UserRegisterSerializer(data=user_data)
        user.is_valid()
        user = user.save()
        user.set_password( user_data.get('password'))
        user.save()
        cast = models.CastInfo.objects.create(user=user, **validated_data)

        cast.languages.set( languages)
        cast.intersted_in.set( intersted_in)
        cast.additional_skills.set( additional_skills)

        return cast

class CastUpdateSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.CastInfo
        exclude = 'user',
    

    def validate_phone(self, telephone):
        import re
        match = re.match('(0|\+251)(9\d{8})', telephone)
        if match:
            return "+251%s" %(match.group(2))
        
        raise serializers.ValidationError('Invalid phone number provided')
class UserUpdateSerializer(serializers.ModelSerializer):
    cast = CastUpdateSerializer()
    
    class Meta:
        model = models.User 
        fields = "username", "first_name", "last_name", 'email','cast'
    
        extra_kwargs = {
            'first_name': {'required': True, "allow_blank" : False},
            'last_name': {'required': True, "allow_blank" : False},
        }

    def update(self, instance, validated_data):
        
        validated_data = validated_data.copy()
        cast_data = validated_data.pop('cast')
        cast = instance.cast

        #Cast update
        cast.profile_picture = cast_data.pop('profile_picture')
        cast.birth_date = cast_data.pop('birth_date')
        cast.facebook = cast_data.pop('facebook')
        cast.instagram = cast_data.pop('instagram')
        cast.twitter = cast_data.pop('twitter')
        cast.phone = cast_data.pop('phone')
        cast.gender = cast_data.pop('gender')
        cast.height = cast_data.pop('height')
        cast.weight = cast_data.pop('weight')
        cast.region = cast_data.pop('region')
        cast.city = cast_data.pop('city')
        cast.languages.set( cast_data.pop('languages'))
        cast.intersted_in.set( cast_data.pop('intersted_in'))
        cast.additional_skills.set( cast_data.pop('additional_skills'))

        instance.cast.save()

        #user update 
        instance.username = validated_data.get('username', instance.username)
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.email = validated_data.get('email', instance.email)
        instance.save() 

        return instance


class AgentRegisterSerializer(serializers.ModelSerializer):
    
    user = UserRegisterSerializer()
    
    class Meta:

        model = models.AgentInfo
        fields = '__all__'
    
    def save(self):

        validated_data = self.validated_data.copy()
        
        user_data = validated_data.pop('user')
        password = user_data.get('password')

        user = get_user_model().objects.create(**user_data)
        user.set_password(password)
        user.save()

        agent = models.AgentInfo.objects.create(user=user, **validated_data)


        return agent

class AgentUpdateSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.AgentInfo
        exclude = 'user', 'balance'
    

    def validate_phone(self, telephone):
        import re
        match = re.match('(0|\+251)(9\d{8})', telephone)
        if match:
            return "+251%s" %(match.group(2))
        
        raise serializers.ValidationError('Invalid phone number provided')
class UserAgentUpdateSerializer(serializers.ModelSerializer):
    agent = AgentUpdateSerializer()
    
    class Meta:
        model = models.User 
        fields = "username", "first_name", "last_name", 'email','agent'
    
        extra_kwargs = {
            'first_name': {'required': True, "allow_blank" : False},
            'last_name': {'required': True, "allow_blank" : False},
        }

    def update(self, instance, validated_data):
        
        validated_data = validated_data.copy()
        agent_data = validated_data.pop('agent')
        agent = instance.agent

        #Cast update
        agent.phone = agent_data.pop('phone')
        agent.company = agent_data.pop('company')
        agent.city = agent_data.pop('city')
        agent.region = agent_data.pop('region')
        instance.agent.save()

        #user update 
        instance.username = validated_data.get('username', instance.username)
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.email = validated_data.get('email', instance.email)
        instance.save() 

        return instance



class AgentReadSerializer(serializers.ModelSerializer):
    region = RegionSerializer() 
    city = CitySerializer() 

    class Meta:
        model = models.AgentInfo
        fields = '__all__'

class LoggedCastInfoReadSerializer(serializers.ModelSerializer):
    region = RegionSerializer() 
    city = CitySerializer() 
    languages = LanguageSerializer(many=True)
    additional_skills = AdditionalSkillSerializer(many=True)
    intersted_in = InterestTagSerializer(many=True)
    #user = UserCastReadSerializer()
    age = serializers.SerializerMethodField()

    def get_age(self, cast):
        today = date.today() 
        age = today.year - cast.birth_date.year - ((today.month, today.day) < (cast.birth_date.month, cast.birth_date.day)) 
    
        return age 

    class Meta:
        model = models.CastInfo
        exclude = "user",

class LoggedUserInfoSerializer( serializers.ModelSerializer):
    cast = LoggedCastInfoReadSerializer()
    photos = CastPhotoGallerySerializer(many=True)
    videos = CastVideoGallerySerializer(many=True)
    work_histories = WorkHistorySerializer(many=True)
    education_histories = EducationHistorySerializer(many=True)
    
    class Meta:
        model = models.User 
        exclude = "is_superuser", "is_staff", 'is_active','groups', 'user_permissions','password'

class LoggedUserAgentSerializer( serializers.ModelSerializer):
    agent = AgentReadSerializer()
    
    class Meta:
        model = models.User 
        exclude = "is_superuser", "is_staff", 'is_active','groups', 'user_permissions','password'

class RevealCastAdressSerializer( serializers.Serializer):
    cast = serializers.IntegerField()

    def validate_cast(self, castID):
        try:
            cast = models.User.objects.get(pk = castID)
        except:
            raise serializers.ValidationError("Model not found.")
        
        if not hasattr(cast, "cast"):
            raise serializers.ValidationError("Model not found.")
        
        return cast.cast
    
    def validate(self, attrs):
        cast = attrs['cast']
        user = self.context['request'].user

        if user.agent.balance < constants.MODEL_REVEAL_PRICE:
            raise serializers.ValidationError("You don't have sufficient balance.")
        
        if not user.agent.withdraw( constants.MODEL_REVEAL_PRICE):
            raise serializers.ValidationError("Please try again. Failed to execute the payment.")

        return attrs 

    def reveal(self):
        attrs = self.validated_data
        cast = attrs['cast']
        agentUsr = self.context['request'].user
        models.AgentModel.objects.get_or_create( agent = agentUsr , cast=cast.user)

        return cast

class JobListSerializer(serializers.ModelSerializer):
    region = RegionSerializer()
    class Meta:
        model = models.Job
        exclude = 'requirement',

class JobCreateSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = models.Job 
        exclude = "created_by", "created_on"
    
    def save(self):
        agentUsr = self.context['request'].user
        job = models.Job.objects.create(created_by = agentUsr, **self.validated_data)

        return job


