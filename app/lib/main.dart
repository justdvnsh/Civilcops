import 'package:civilcops/screens/OnBoardingScreen.dart';
import 'package:civilcops/screens/SplashScreen.dart';
import 'package:civilcops/screens/auth/LoginScreen.dart';
import 'package:civilcops/screens/auth/SingupScreen.dart';
import 'package:civilcops/screens/auth/otpScreen.dart';
import 'package:civilcops/screens/home/bottomBar/reportScreen.dart';
import 'package:civilcops/screens/home/confirmLocationScreen.dart';
import 'package:civilcops/screens/home/mainScreen.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal[500],
        primaryColorDark: Colors.teal[900],
        scaffoldBackgroundColor: Color(0xffc9e9f6)
      ),
      initialRoute: LoginScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        OTPVerificationScreen.id: (context) => OTPVerificationScreen(),
        ConfirmLocationScreen.id: (context) => ConfirmLocationScreen(),
        MainScreen.id: (context) => MainScreen(),
        ReportScreen.id: (context) => ReportScreen(),
      }
    );
  }
}