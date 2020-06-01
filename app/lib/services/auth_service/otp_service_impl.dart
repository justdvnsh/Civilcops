import 'dart:convert';

import 'package:civilcops/services/auth_service/otp_service.dart';
import 'package:http/http.dart' as http;

class OtpServiceImpl extends OtpService {
  
  var client = http.Client();
  final String BASE_URL_GET_OTP = "https://api.msg91.com/api/v5/otp?authkey=218456AvFRW8hN26L5ecfd51fP1&mobile=";
  final String BASE_URL_VERIFY_OTP = "https://api.msg91.com/api/v5/otp/verify?authkey=218456AvFRW8hN26L5ecfd51fP1&mobile=";

  @override
  Future<bool> getOtp({String mobileNumber}) async {
    String url = BASE_URL_GET_OTP + "91" + mobileNumber;
    http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      try {
        print(response.body);
        return json.decode(response.body)["type"] == "success" ? true: false;
      } catch(e) {
        print(e);
        return false;
      }
    } else {
      print(response.statusCode);
      return false;
    }
  }

  @override
  Future<bool> verifyOtp({String mobileNumber, String otpCode}) async {
    String url = BASE_URL_GET_OTP + "91" + mobileNumber + "&otp=" + otpCode;
    http.Response response = await client.post(url);
    if (response.statusCode == 200) {
      try {
        print(response.body);
        return json.decode(response.body)["type"] == "success" ? true: false;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      print(response.statusCode);
      return false;
    }
  }

}