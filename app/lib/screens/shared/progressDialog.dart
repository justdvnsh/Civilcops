import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProgressDialogWidget  {
  
  static ProgressDialog pr;

  static ProgressDialog getProgressBar({context}) {
    pr = ProgressDialog(context, isDismissible: true);
    pr.style(
          message: 'Please Wait...',
          borderRadius: 10.0,
          backgroundColor: Colors.white,
          progressWidget: CircularProgressIndicator(),
          elevation: 10.0,
          insetAnimCurve: Curves.easeInOut,
          progress: 0.0,
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
        );
    return pr;
  }
}