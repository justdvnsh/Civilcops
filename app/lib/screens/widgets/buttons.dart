import 'package:civilcops/utils/Colors.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {

  GestureTapCallback onPressed;
  String buttonText;
  double textSize;
  FontWeight textWeight;

  CustomButtons({this.buttonText, this.onPressed, this.textSize, this.textWeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(colors: [Colors.teal[400], Colors.teal[800]]),
        ),
        child: Center(
          child: Text(
            this.buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: textSize != null ? textSize : 24.0,
              fontWeight: textWeight != null ? textWeight : null
            ),
          ),
        ),
      ),
    );
  }
}