from mongoengine import *

## Defines the user
class User(Document):
    firstName = StringField()
    lastName = StringField()
    email = EmailField()
    mobileNumber = StringField(required=True)
    coordinates = GeoPointField()

## Defines the complaints by the user.
class Complaints(Document):    
    complaintIdentity = StringField(required=True)
    concernedDept = StringField()
    imageUrl = URLField()
    description = StringField()
    attachment = URLField()
    user = ReferenceField(User)

class Feedback(Document):
    feedbackValue = IntField()
    user = ReferenceField(User)    
