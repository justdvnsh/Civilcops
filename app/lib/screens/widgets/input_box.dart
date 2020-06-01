import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputBox extends StatelessWidget {

  String hintText;
  TextInputType keyboardType;
  bool obscureText;
  TextEditingController controller;
  Function validate;
  Function save;
  bool enabled;
  TextStyle hintTextStyle;

  InputBox({this.hintText, this.keyboardType, this.obscureText, this.controller, this.validate, this.save, this.enabled, this.hintTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14.0),
      child: TextFormField(
        enabled: enabled,
        controller: this.controller,
        obscureText: this.obscureText,
        keyboardType: this.keyboardType,
        style: TextStyle(
            color: Colors.black
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: this.hintText,
          hintStyle: hintTextStyle == null ? TextStyle(
              color: Colors.grey
          ) : hintTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red, width: 1.0)
          ),
          contentPadding: EdgeInsets.all(23)
        ),
        validator: this.validate,
        onSaved: this.save,
      ),
    );
  }
}