from rest_framework import serializers 
from gocasting import models, constants
from django.db.models import Q
from datetime import date 

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

class CastVideoGallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.VideoGallery
        fields = "__all__"

class WorkHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.WorkHistory
        fields = "__all__"

class EducationHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.EducationHistory
        fields = "__all__"

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
    
    def getAll(self, attrs):
        queryset = models.CastInfo.objects.all()
        age = attrs.get('age')
        height = attrs.get('height')
        weight = attrs.get('weight')
        gender = attrs.get('gender', 'all')
        name = attrs.get('name')
        discipline = attrs.get('discipline', -1)

        if discipline and discipline != -1:
            queryset = queryset.filter(intersted_in__pk__contains = discipline)
        if age:
            queryset = queryset.filter(age__lte = age[1], age__gte=age[0])
        
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

class CastRegisterSerializer(serializers.ModelSerializer):
    user = UserRegisterSerializer()
    class Meta:
        model = models.CastInfo
        fields = '__all__'
    
    def save(self):
        validated_data = self.validated_data.copy()
        languages = validated_data.pop('languages')
        intersted_in = validated_data.pop('intersted_in')
        additional_skills = validated_data.pop('additional_skills')
        
        user = UserRegisterSerializer(data=validated_data.pop('user'))
        user.is_valid()
        user = user.save()
        cast = models.CastInfo.objects.create(user=user, **validated_data)

        cast.languages.set( languages)
        cast.intersted_in.set( intersted_in)
        cast.additional_skills.set( additional_skills)

        return cast

class AgentRegisterSerializer(serializers.ModelSerializer):
    
    user = UserRegisterSerializer()
    
    class Meta:

        model = models.AgentInfo
        fields = '__all__'
    
    def save(self):

        validated_data = self.validated_data.copy()
        user = UserRegisterSerializer(data=validated_data.pop('user'))
        user.is_valid()
        user = user.save()
        agent = models.AgentInfo.objects.create(user=user, **validated_data)


        return agent

class LoggedCastInfoReadSerializer(serializers.Serializer):
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

class LoggedUserInfoSerializer( serializers.ModelSerializer):
    cast = LoggedCastInfoReadSerializer()
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


