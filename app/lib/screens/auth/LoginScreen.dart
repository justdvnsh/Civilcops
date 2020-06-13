import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/business_logic/viewmodels/login_viewmodel.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/screens/widgets/input_box.dart';
import 'package:civilcops/screens/widgets/scroll.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {

  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  User userModel = User();
  LoginViewModel model = serviceLocator<LoginViewModel>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildView(model),
    );
  }

  Widget buildView(LoginViewModel viewModel) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: viewModel,
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) {
          return Scroll(
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "Let\s Get Started",
                      style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black87),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Form(
                      key: this._formKey,
                      child: Column(
                        children: <Widget>[
                          InputBox(
                            hintText: "Enter Mobile Number",
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                            validate: (String val) {
                              if (val.isEmpty || val.length != 10) {
                                return 'Invalid Mobile Number';
                              } else {
                                return null;
                              }
                            },
                            save: (String val) => userModel.mobileNumber = val,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomButtons(
                      buttonText: "LOGIN",
                      onPressed: () {
                        if (this._formKey.currentState.validate()) {
                          this._formKey.currentState.save();
                          model.login(context: context, mobileNumber: userModel.getMobileNumber()); 
                        } else {
                          Fluttertoast.showToast(msg: "Mobile Number is not valid");
                        }
                      },
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don\'t have an account? ",
                          style: TextStyle(
                            fontSize: 14.0
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.navigateToSignupView(context: context);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.cyan
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Center(
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Connect With",
                          style: TextStyle(
                            fontSize: 20.0
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset("images/facebook.png", fit: BoxFit.fill,),
                            ),
                            SizedBox(width: 15.0),
                            Container(
                              height: 105,
                              width: 90,
                              child: Image.asset("images/google.png", fit: BoxFit.fill,),
                            ),
                          ],
                        ),
                        SizedBox(height: 35.0,),
                        Text(
                          "By Using, you agree to",
                          style: TextStyle(
                            fontSize: 14.0
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Terms of Service and Privacy Policy",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.cyan
                          ),
                        ),
                      ]
                    )
                  ],
              ),
            ),
          );
        },
      )
    );
  }
}
