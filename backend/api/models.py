from mongoengine import *

class User(Document):
    firstName = StringField()
    lastName = StringField()
    email = StringField()
    mobileNumber = StringField(required=True)