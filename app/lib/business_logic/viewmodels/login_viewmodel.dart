import 'dart:async';
import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/screens/auth/SingupScreen.dart';
import 'package:civilcops/screens/auth/otpScreen.dart';
import 'package:civilcops/screens/shared/progressDialog.dart';
import 'package:civilcops/services/auth_service/auth_service.dart';
import 'package:civilcops/services/auth_service/otp_service.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginViewModel extends ChangeNotifier {

  final AuthService _authService = serviceLocator<AuthService>();
  final OtpService _otpService = serviceLocator<OtpService>();
  ProgressDialog pr;

  void login({context, User user}) async {
    pr = ProgressDialogWidget.getProgressBar(context: context);
    await pr.show();
    final bool response = await _authService.login(mobileNumber: user.getMobileNumber());
    final bool otpSent = await getOtp(mobileNumber: user.getMobileNumber());
    if (response && otpSent) {
      pr.hide().whenComplete(() {
        Fluttertoast.showToast(msg: "Otp Sent to your number");
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context) => OTPVerificationScreen(user: user) 
            ),
        );
      });
    } else {
      pr.hide().whenComplete(() {
        Fluttertoast.showToast(msg: "Cannot Login :( Please make sure that your entered mobile number is correct.");
      });
    }

    notifyListeners();
  }

  Future<bool> getOtp({String mobileNumber}) async {
    final bool response = await _otpService.getOtp(mobileNumber: mobileNumber);
    if (response) {
      return true;
    } else {
      return false;
    } 
  }

  void navigateToSignupView({context}) {
    Navigator.pushNamed(context, SignupScreen.id);
  }
}