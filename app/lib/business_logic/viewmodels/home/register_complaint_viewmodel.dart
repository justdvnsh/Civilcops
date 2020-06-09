import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterComplaintViewModel extends ChangeNotifier {
  int _currentSteps = 0;
  static bool _complete = false;

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

  int get currentSteps => _currentSteps;
  bool get complete => _complete;
}