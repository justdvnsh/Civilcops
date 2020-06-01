from django.conf.urls import url 
from django.urls import path, include
from api.views import SignupView, LoginView

app_name = "api"
urlpatterns = [
    path('api/signup/', SignupView.as_view(), name="SignupView"),
    path('api/login/', LoginView.as_view(), name="LoginView")
]
