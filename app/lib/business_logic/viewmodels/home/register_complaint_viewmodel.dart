import 'package:civilcops/business_logic/models/complaints.dart';
import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/services/complaint_services/report_complaint_service.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterComplaintViewModel extends ChangeNotifier {
  int _currentSteps = 0;
  static bool _complete = false;
  final ReportComplaintService _complaintService = serviceLocator<ReportComplaintService>();

  next(int length) {
    _currentSteps + 1 != length ? goTo(_currentSteps + 1) : _complete = true;
    notifyListeners();
  }

  goTo(int step) {
    _currentSteps = step;
    _complete = true;
    notifyListeners();
  }

  cancel() {
    if (_currentSteps > 0) {
      goTo(_currentSteps - 1);
    }
    notifyListeners();
  }

  void submit({context, Complaint complaint, User user,}) async {
    List response = await _complaintService.reportComplaint(complaint: complaint, user: user);
    print(response.toString());
    if (response != null && response.isNotEmpty && response[1]) {
      Fluttertoast.showToast(msg: "Your Complaint Has been recorded with ${response[0]} complaint id");
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(msg: "Cannot record your complaint");
    }
    notifyListeners();
  }

  int get currentSteps => _currentSteps;
  bool get complete => _complete;
}