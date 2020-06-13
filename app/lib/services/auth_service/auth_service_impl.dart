
import 'dart:convert';

import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/services/auth_service/auth_service.dart';
import 'package:http/http.dart' as http;

class AuthServiceImpl implements AuthService {

  // When deployed -> Change the base url to the domained url.

  var client = http.Client();
  final String BASE_URL = "http://192.168.1.100:8000/civilcops/api/";
  final result = List();
  final User user = User();

  @override
  Future<List> login({String mobileNumber}) async {
    String url = BASE_URL + "login/";
    var data = {
      "mobile_number": mobileNumber
    };
    http.Response response = await client.post(url, body: data);
    if (response.statusCode == 200) {
      try {
        print(response.body);
        if (json.decode(response.body)["type"] == "success") {
          user.email = json.decode(response.body)["user_email"];
          user.firstName = json.decode(response.body)["user_firstName"];
          user.lastName = json.decode(response.body)["user_lastName"];
          user.mobileNumber = mobileNumber;
          result.add(user);
          result.add(true);
          print(result.toString());
          return result;
        } else {} 
      } catch(e) {
        print(e);
        result.add("null");
        result.add(false);
        return result;
      }
    } else {
      print(response.statusCode);
      result.add("null");
      result.add(false);
      return result;
    }
  }

  @override
  Future<bool> signup({User user}) async {
    String url = BASE_URL + "signup/";
    var data = {
      "first_name": user.getFirstName(),
      "last_name": user.getLastName(),
      "email": user.getEmail(),
      "mobile_number": user.getMobileNumber()
    };
    http.Response response = await client.post(url, body: data);
    if (response.statusCode == 200) {
      try {
        print(response.body);
        return json.decode(response.body)['type'] == "success" ? true : false;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      print(response.statusCode);
      print(response.body);
      return false;
    }
  }

}