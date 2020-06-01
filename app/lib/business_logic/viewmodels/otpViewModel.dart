
import 'package:civilcops/screens/home/confirmLocationScreen.dart';
import 'package:civilcops/screens/shared/progressDialog.dart';
import 'package:civilcops/services/auth_service/otp_service.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class OtpViewModel extends ChangeNotifier {

  final OtpService _otpService = serviceLocator<OtpService>();
  ProgressDialog pr;

  void verifyOtp({context, String mobileNumber, String otpCode}) async {
    pr = ProgressDialogWidget.getProgressBar(context: context);
    await pr.show();
    final bool response = await _otpService.verifyOtp(mobileNumber: mobileNumber, otpCode: otpCode);
    if (response) {
      pr.hide().whenComplete(() {
        Navigator.pushReplacementNamed(context, ConfirmLocationScreen.id);        
      });
    } else {
      pr.hide().whenComplete(() {
        Fluttertoast.showToast(msg: "Cannot Verify Otp :( Please make sure that you have entered correct OTP.");
      });
    }
  }

}