"""gocastingapi URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from gocasting import views 
from django.conf.urls.static import static
from django.conf import settings
from django.conf.urls import url

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', views.LoginView.as_view()),
    path("user.info/", views.UserInfoView.as_view()),
    path("logout/", views.LogoutView.as_view()),
    path("user.changepasswd/", views.UserChangePasswordView.as_view()),
    path('casts/', views.AllCastView.as_view()),
    path('casts.search/', views.SearchCastView.as_view()),
    path('cast.register/', views.CastRegisterView.as_view()),
    path("cast.address.reveal/", views.AgentRevealModelAdressView.as_view()),
    path('agent.register/', views.AgentRegisterView.as_view()),
    path('agent.update/', views.AgentUpdateView.as_view()),
    url("cast.update/$", views.CastInfoUpdateView.as_view()),
    url("cast.workhistory/$", views.WorkHistoryCreateView.as_view()),
    url("cast.workhistory.remove/(?P<workID>\d+)/$", views.WorkHistoryDestroyView.as_view()),
    url("cast.educations/$", views.EducationHistoryCreateView.as_view()),
    url("cast.educations.remove/(?P<eduID>\d+)/$", views.EducationHistoryDestroyView.as_view()),
    url("cast.gallery/$", views.CasatPhotoGalleryView.as_view()),
    url("cast.gallery.remove/$", views.CasatPhotoGalleryDestroyView.as_view()),
    url("cast.video/$", views.CastVideoGalleryView.as_view()),
    url("cast.video.remove/(?P<videoID>\d+)/$", views.CastVideoGalleryDestroyView.as_view()),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    url('^casts/(?P<castID>\d+)/$', views.CastDetailView.as_view()),
    url('^disciplines/$', views.AllDisciplines.as_view()),
    url('^attributedatas/$', views.AttributeDataView.as_view()),
    url('^upload.picture/$', views.PictureAreaView.as_view()),
    url('^job.create/$', views.JobCreateView.as_view()),
    url('^jobs/$', views.JobListView.as_view()),
    url('^jobs/(?P<jobID>\d+)/$', views.JobDetailView.as_view()),
    url('^job.update/(?P<jobID>\d+)/$', views.JobUpdateView.as_view()),
    url('^job.remove/(?P<jobID>\d+)/$', views.JobDestroyView.as_view()),
    url('^job.apply/$', views.JobApply.as_view()),
    url('^search-jobs/$', views.JobSearchView.as_view()),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
