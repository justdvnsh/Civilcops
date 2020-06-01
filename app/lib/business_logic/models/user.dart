
import 'package:flutter/foundation.dart';

class User {

  String firstName;
  String lastName;
  String email;
  String mobileNumber;

  User({this.email, this.firstName, this.lastName, this.mobileNumber});

  String getEmail() {
    return this.email;
  }

  String getFirstName() {
    return this.firstName;
  }

  String getLastName() {
    return this.lastName;
  }

  String getMobileNumber() {
    return this.mobileNumber;
  }
}