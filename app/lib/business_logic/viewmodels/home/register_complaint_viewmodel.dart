import 'package:flutter/foundation.dart';

class RegisterComplaintViewModel extends ChangeNotifier {
  int _currentSteps = 0;
  bool _complete = false;

  next(int length) {
    _currentSteps + 1 != length ? goTo(_currentSteps + 1) : _complete = true;
    notifyListeners();
  }

  goTo(int step) {
    _currentSteps = step;
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