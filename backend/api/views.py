from rest_framework.views import APIView
from rest_framework import views
from rest_framework.response import Response 
from rest_framework import status
from mongo_auth.permissions import AuthenticatedOnly
from .models import User, Complaints, Feedback
from .serializers import UserSerializer
from mongoengine import *
import json
from bson import ObjectId

class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId):
            return str(o)
        return json.JSONEncoder.default(self, o)

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

class RegisterComplaintView(APIView):

    # def get(self, request):
    #     pass

    def post(self, request):
        userQuerySet = []
        if checkIfMobileNumberIsAlreadyRegistered(request.data.get("user_number")):
            userQueryset = User.objects(mobileNumber = request.data.get("user_number"))
        complaint = Complaints(
            complaintIdentity = request.data.get("complaint_identity"),
            concernedDept = request.data.get("concerned_dept"),
            imageUrl = request.data.get("image_url"),
            description = request.data.get("description"),
            attachment = request.data.get("attachment_url"),
            status = request.data.get("status"),
            user = userQueryset[0]
            )

        try:
            complaint.save()
            return Response(data = {
                "type": "Success",
                "id": JSONEncoder().encode(complaint.id),
                "dept": complaint.concernedDept,
                "user": [user.email for user in userQueryset][0]
            }, status=status.HTTP_200_OK)
        except Exception as e:
            return Response(data = {
                "message": "Cannot save your complaint !",
                "type": "failure",
                "error": e
            }, status=status.HTTP_400_BAD_REQUEST)

class MyComplaintsView(APIView):
    def get(self, request, email):
        userQueryset = User.objects(email = email)
        print([user.email for user in userQueryset])
        if len(userQueryset) > 0:
            myComplaints = Complaints.objects(user=userQueryset[0])
            if myComplaints:
                return Response(data = {
                    "type": "Success",
                    "MyComplaints": [complaints.description for complaints in myComplaints]
                })
            else:
                return Response(data = {
                    "type": "Failure",
                    "message": "No Complaints Yet !"
                })
        else :
            return Response(data = {
                "type": "Failure",
                "message": "No user with the provided email exists"
            })

class FeedbackView(APIView):       
    def post(self, request):
        pass