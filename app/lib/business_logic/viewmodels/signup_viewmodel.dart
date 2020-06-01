import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/screens/auth/LoginScreen.dart';
import 'package:civilcops/screens/shared/progressDialog.dart';
import 'package:civilcops/services/auth_service/auth_service.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignupViewModel extends ChangeNotifier {

  final AuthService _authService = serviceLocator<AuthService>();
  ProgressDialog pr;

  void signup({context, User user}) async {
    pr = ProgressDialogWidget.getProgressBar(context: context);
    await pr.show();
    final bool response = await _authService.signup(user: user);
    if (response) {
      pr.hide().whenComplete(() {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      });
    } else {
      pr.hide().whenComplete(() {
        Fluttertoast.showToast(msg: "Cannot Signup :( Mobile Number Already in Use");
      });
    }
    notifyListeners();
  }

  // navigation logic
  void NavigateToLoginView(context) {
    Navigator.pushNamed(context, LoginScreen.id);
  }
}