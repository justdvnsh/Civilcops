from django.conf.urls import url 
from django.urls import path, include
from api.views import SignupView, LoginView

app_name = "api"
urlpatterns = [
    ## auth urls
    path('api/signup/', SignupView.as_view(), name="SignupView"),
    path('api/login/', LoginView.as_view(), name="LoginView"),

    ## user complaint urls
    path('api/registerComplaint/', RegisterComplaintsView.as_view(), name="RegisterComplaintView"),
    
    ## feedback urls
    path('api/feedback/', FeedbackView.as_view(), name="FeedbackView")
]
