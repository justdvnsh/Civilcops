from rest_framework import serializers
from .models import User, Complaints

class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = '__all__'

class ComplaintsSerializer(serializers.ModelSerializer):

    class Meta:
        model = Complaints
        fields = '__all__'       