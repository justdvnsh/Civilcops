from rest_framework.views import APIView
from rest_framework import views
from rest_framework.response import Response 
from rest_framework import status
from mongo_auth.permissions import AuthenticatedOnly
from .models import User
from .serializers import UserSerializer
from mongoengine import *
import json

connect('civilcops')


def checkIfMobileNumberIsAlreadyRegistered(number):
    if (User.objects(mobileNumber = number)):
        return True
    else:
        return False

# Create your views here.
## Just a test view. 
class SignupView(APIView):  

    def post(self, request):
        user = User(
            firstName = request.data.get("first_name"),
            lastName = request.data.get("last_name"),
            email = request.data.get("email"),
            mobileNumber = request.data.get("mobile_number")
        )
        try:
            if (checkIfMobileNumberIsAlreadyRegistered(request.data.get("mobile_number"))):
                return Response(
                    data={
                        "data": "Mobile Number Already in Use",
                        "type": "failure"
                        },
                        status=status.HTTP_403_FORBIDDEN
                )
            else:
                user.save()
                return Response(
                    data={
                        "data": "User saved",
                        "type": "success"
                        },
                        status=status.HTTP_200_OK
                )
        except Exception as e:
            return Response(data={
                "data": "Cannot Save User",
                "type": "failure",
                "error": e
            })

class LoginView(APIView):

    def post(self, request):
        user = checkIfMobileNumberIsAlreadyRegistered(request.data.get("mobile_number"))
        if user:
            return Response(data={
                "data": "User Is Logged in",
                "type": "success"
            })
        else:
            return Response(data={
                "data": "User not logged in",
                "type": "failure"
            })