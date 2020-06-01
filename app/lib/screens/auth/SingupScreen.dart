import 'package:validators/validators.dart' as validator;
import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/business_logic/viewmodels/signup_viewmodel.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/screens/widgets/input_box.dart';
import 'package:civilcops/screens/widgets/scroll.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:civilcops/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {

  static String id = "SignupScreen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();
  User userModel = User();
  SignupViewModel model = serviceLocator<SignupViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildView(model),
    );
  }

  Widget buildView(SignupViewModel viewModel) {
    return ChangeNotifierProvider<SignupViewModel>.value(
      value: viewModel,
      child: Consumer<SignupViewModel>(
        builder: (context, model, child) => Scroll(
          child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Create an Account",
                    style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black87),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Sign Up to begin",
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
                          hintText: "Enter First Name",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validate: (String val) {
                            if (val.isEmpty) {
                              return 'Must provide a First Name';
                            } else {
                              return null;
                            }
                          },
                          save: (String val) => userModel.firstName = val,
                        ),
                        InputBox(
                          hintText: "Enter Last Name",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validate: (String val) {
                            if (val.isEmpty) {
                              return 'Must Provide a last Name';
                            } else {
                              return null;
                            }
                          },
                          save: (String val) => userModel.lastName = val,
                        ),
                        InputBox(
                          hintText: "Enter Email Address",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validate: (String val) {
                            if (!validator.isEmail(val) || val.isEmpty) {
                              return 'Must provide a valid Email';
                            } else {
                              return null;
                            }
                          },
                          save: (String val) => userModel.email = val,
                        ),
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
                    buttonText: "SIGNUP",
                    onPressed: () {
                      if (this._formKey.currentState.validate()) {
                        this._formKey.currentState.save();
                        model.signup(context: context, user: userModel); 
                      } else {
                        Fluttertoast.showToast(msg: "Form filled is not valid");
                      }
                    },
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 14.0
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.NavigateToLoginView(context);
                        },
                        child: Text(
                          "LOGIN",
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
        )
      )
    );
  }
}
