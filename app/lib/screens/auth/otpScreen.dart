import 'dart:async';

import 'package:civilcops/business_logic/viewmodels/otpViewModel.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/screens/widgets/scroll.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:civilcops/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OTPVerificationScreen extends StatefulWidget {

  static String id = "OTPVerificationScreen";
  final String mobileNumber;

  OTPVerificationScreen({this.mobileNumber});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  String mobileNumber;
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  OtpViewModel model = serviceLocator<OtpViewModel>();

  @override
  void initState() {
    super.initState();
    mobileNumber = widget.mobileNumber;
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: buildView(model),
    );
  }

  Widget buildView(OtpViewModel viewModel) {
    return ChangeNotifierProvider<OtpViewModel>.value(
      value: viewModel,
      child: Consumer<OtpViewModel>(
        builder: (context, model, child) {
          return Scroll(
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "OTP has been sent to your mobile number ${mobileNumber.replaceRange(0, 5, "X")}",
                      style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black87),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Enter your OTP",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    PinCodeTextField(
                      length: 4,
                      obsecureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(2),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeColor: Colors.white,
                        activeFillColor: Colors.white,
                        inactiveColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedColor: Colors.white,
                        selectedFillColor: Colors.white
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: kOnBoardingScreenBackgroundColor,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    SizedBox(height: 30),
                    CustomButtons(
                      buttonText: "VERIFY",
                      onPressed: () {
                        if (currentText.length != 4 || currentText.isEmpty) {
                        errorController.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() {
                          hasError = true;
                        });
                        Fluttertoast.showToast(msg: "Please Fill in the correct OTP");
                      } else {
                          model.verifyOtp(context: context, mobileNumber: mobileNumber, otpCode: currentText);
                        }
                      },
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Didn\'t receive any OTP? ",
                          style: TextStyle(
                            fontSize: 14.0
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // model.navigateToSignupView(context: context);
                          },
                          child: Text(
                            "RESEND",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.cyan
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
              ),
            ),
          );
        },
      )
    );
  }
}