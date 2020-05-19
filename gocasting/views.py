from django.shortcuts import render
from rest_framework import generics, views
from gocasting import models, serializers, permissions as gocasting_permissions
from django.conf.urls import url
from rest_framework.response import Response
from collections import namedtuple
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import logout, models as AuthModels
from django.contrib.auth import get_user_model
from django.contrib.auth import authenticate, login
from rest_framework.authtoken.models import Token
from rest_framework.exceptions import AuthenticationFailed
from django.db.models import Q 
from django.shortcuts import get_object_or_404 

AttributeData = namedtuple('AttributeData', ('disciplines', 'languages','regions', 'cities', 'additional_skills'))

class LoginView(views.APIView):

    def formatPhone(self, phone):
        match = re.match('(0|\+251)(9\d{8})', phone)
        print(phone)
        if match:
            return "+251{}".format(match[2])
        
        return phone

    def post(self, request):
        try:
            user_identifier = request.data.get('username')
            print(user_identifier, "Username")
            user_identifier_filter = Q(username=user_identifier) | Q(email = user_identifier)
            user = models.User.objects.get( user_identifier_filter )                
        except Exception as e:
            print("ERROR", e)
            raise AuthenticationFailed("Invalid username or password")

        if not user.check_password( request.data.get('password') ):
            raise AuthenticationFailed('Invalid username or password.')
        
        if not user.is_active:
            raise AuthenticationFailed("Your account is not activated yet. Please call to 0944604444 for further informatin about your account activation. ")
        
        if user:
            login(request, user)
            Token.objects.filter(user=user).delete()
            token = Token.objects.create(user=user)
            return Response({'token' : token.key})
        
        raise AuthenticationFailed('Invalid username or password.')


# Create your views here.
class AllCastView( generics.ListAPIView):
    serializer_class = serializers.CastInfoReadSerializer
    queryset = models.CastInfo.objects.all()
    #page_size = 5

class AllDisciplines( generics.ListAPIView):

    serializer_class = serializers.InterestTagSerializer
    queryset = models.InterestTag.objects.all()
    pagination_class = None

class AttributeDataView(generics.ListAPIView):
    def list(self, request, *args, **kwargs):
        data = AttributeData(
            disciplines = models.InterestTag.objects.all(),
            languages = models.Language.objects.all(),
            regions = models.Region.objects.all(),
            cities = models.City.objects.all(),
            additional_skills = models.AdditionalSkill.objects.all(),
        )

        serializer = serializers.AttributeDataSerializer(data)

        return Response(serializer.data)

class CastDetailView( generics.RetrieveAPIView):
    serializer_class = serializers.CastInfoReadSerializer
    queryset = models.CastInfo.objects.all()
    lookup_url_kwarg ='castID'

    def get_object(self):
        return get_object_or_404(self.get_queryset(), pk = self.kwargs[self.lookup_url_kwarg])

    def retrieve(self, request, *args, **kwargs):
        cast = self.get_object()
        reqUser = request.user

        #user can access private data of the model
        can_access = reqUser.is_authenticated and hasattr(reqUser, "agent")
        can_access = can_access and reqUser.adress_availables.filter(cast = cast.user).exists()

        if can_access:
            serializer = self.get_serializer(cast)
        else:
            print("Private access")
            serializer = serializers.CastInfoPublicReadSerializer( cast )
        
        return Response( serializer.data )

class AgentRevealModelAdressView( views.APIView):

    permission_classes = (gocasting_permissions.IsAgent, )

    def post(self, request, *args, **kwargs):
        serializer = serializers.RevealCastAdressSerializer(data= request.data, context={'request' : request})
        serializer.is_valid(raise_exception = True)
        cast = serializer.reveal()
        cast_serializer = serializers.CastInfoReadSerializer(cast)
        return Response( cast_serializer.data  )

class SearchCastView( generics.CreateAPIView):
    serializer_class = serializers.SearchCastSerializer
    queryset = models.CastInfo.objects.all() 

    def create(self,request, *args, **kwargs):
        searchSerializer = serializers.SearchCastSerializer(data = request.data )
        searchSerializer.is_valid(raise_exception=True) 
        
        data = searchSerializer.validated_data
        casts = searchSerializer.getAll(data)
        casts = self.paginate_queryset(casts)

        serializer = serializers.CastInfoReadSerializer(casts, many=True, context={'request' : request})
        return self.get_paginated_response(serializer.data)

class PictureAreaView(generics.CreateAPIView):
    serializer_class = serializers.PictureAreaSerializer
    queryset = models.PictureArea.objects.all()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

class CastRegisterView( generics.CreateAPIView):
    serializer_class = serializers.CastRegisterSerializer
    queryset = models.CastInfo.objects.all()


class AgentRegisterView( generics.CreateAPIView):
    serializer_class = serializers.AgentRegisterSerializer
    queryset = models.AgentInfo.objects.all()

class AgentUpdateView( generics.UpdateAPIView):
    serializer_class = serializers.UserAgentUpdateSerializer
    queryset = models.User.objects.all()
    permission_classes = (IsAuthenticated, )


    def get_object(self):
        return self.request.user

class UserInfoView(views.APIView):
    permission_classes = (IsAuthenticated, )

    def get(self, request, format=None):
        
        if hasattr(request.user, 'cast'):
            serializer = serializers.LoggedUserInfoSerializer(request.user)
            return Response(serializer.data)

        elif hasattr(request.user, 'agent'):
            serializer = serializers.LoggedUserAgentSerializer(request.user)
            return Response(serializer.data)



class LogoutView(views.APIView):
    permission_classes = (IsAuthenticated, )
    def get(self, request):
        logout(request)
        return Response('loggedout')

class CastInfoUpdateView( generics.UpdateAPIView):

    serializer_class = serializers.UserUpdateSerializer
    queryset = models.User.objects.all()
    permission_classes = (IsAuthenticated, )

    def get_object(self):
        return self.request.user

class UserChangePasswordView( generics.UpdateAPIView):

    serializer_class = serializers.UserChangePasswordSerializer
    queryset = models.User.objects.all()
    permission_classes = (IsAuthenticated, )

    def get_object(self):
        return self.request.user
    
    def update(self, request, *args, **kwargs):
        
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial, context={'request': request})
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)
        

class WorkHistoryCreateView(generics.CreateAPIView):
    serializer_class = serializers.WorkHistoryCreateSerializer
    queryset = models.WorkHistory.objects.all() 
    permission_classes = (IsAuthenticated, )

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data = request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(request.user)
        
        return Response(serializer.data)

class WorkHistoryDestroyView(generics.DestroyAPIView):

    serializer_class = serializers.WorkHistoryCreateSerializer
    queryset = models.WorkHistory.objects.all() 
    permission_classes = (IsAuthenticated, )
    lookup_url_kwarg ='workID'

    def get_object(self):
        return get_object_or_404(self.get_queryset(), user = self.request.user, pk = self.kwargs[self.lookup_url_kwarg])

class EducationHistoryCreateView(generics.CreateAPIView):

    serializer_class = serializers.EducationHistoryCreateSerializer
    queryset = models.EducationHistory.objects.all() 
    permission_classes = (IsAuthenticated, )

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data = request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(request.user)
        
        return Response(serializer.data)

class EducationHistoryDestroyView(generics.DestroyAPIView):

    serializer_class = serializers.EducationHistoryCreateSerializer
    queryset = models.EducationHistory.objects.all() 
    permission_classes = (IsAuthenticated, )
    lookup_url_kwarg ='eduID'

    def get_object(self):
        return get_object_or_404(self.get_queryset(), user = self.request.user, pk = self.kwargs[self.lookup_url_kwarg])

class CasatPhotoGalleryView(generics.CreateAPIView):
    serializer_class = serializers.PhotoGalleryCreateSerializer
    queryset = models.PhotoGallery.objects.all() 
    permission_classes = (IsAuthenticated, )

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data = request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(request.user)
        
        return Response(serializer.data)

class CasatPhotoGalleryDestroyView(generics.DestroyAPIView):
    
    serializer_class = serializers.PhotoGalleryDestroySerializer
    queryset = models.PhotoGallery.objects.all() 
    permission_classes = (IsAuthenticated, )

    def destroy(self, request, *args, **kwargs):
        serializer =  self.get_serializer(data = request.data,  context={'request' : request})
        serializer.is_valid(raise_exception = True)
        serializer.destroy()
        return Response("DONE")

class CastVideoGalleryView(generics.CreateAPIView):
    serializer_class = serializers.VideoGalleryCreateSerializer
    queryset = models.VideoGallery.objects.all() 
    permission_classes = (IsAuthenticated, )

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data = request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(request.user)
        
        return Response(serializer.data)

class CastVideoGalleryDestroyView(generics.DestroyAPIView):
    serializer_class = serializers.VideoGalleryCreateSerializer
    queryset = models.VideoGallery.objects.all() 
    permission_classes = (IsAuthenticated, )
    lookup_url_kwarg ='videoID'

    def get_object(self):
        return get_object_or_404(self.get_queryset(), user = self.request.user, pk = self.kwargs[self.lookup_url_kwarg])


class JobCreateView(generics.CreateAPIView):
    serializer_class = serializers.JobCreateSerializer
    queryset = models.Job.objects.all() 
    permission_classes = (IsAuthenticated, )

    def create(self, request, *args, **kwargs):

        serializer =  self.get_serializer(data = request.data,  context={'request' : request})
        serializer.is_valid(raise_exception = True)
        serializer.save()

        return Response(serializer.data)

    
class JobListView(generics.ListAPIView):

    serializer_class = serializers.JobListSerializer
    queryset = models.Job.objects.all() 
    permission_classes = (IsAuthenticated, )
    