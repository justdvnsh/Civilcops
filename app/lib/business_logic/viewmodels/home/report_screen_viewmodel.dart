import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReportScreenViewModel extends ChangeNotifier {
  int _radioValue = null;
  String _complaintIdentity = "";
  static List<String> dropDownlist = <String>[
    "Municipal Coorporation",
    "Technical Coorporation"
  ];
  String _chosenValue = dropDownlist[0];
  List<DropdownMenuItem<String>> _items = 
  dropDownlist.map<DropdownMenuItem<String>>(
    (String val) => DropdownMenuItem(value: val, child: Text(val))
  ).toList();

  void handleRadioValueChanged(int value) {
    _radioValue = value;
    switch(_radioValue) {
      case 0:
        _complaintIdentity = "Report on your behalf";
        break;
      case 1:
        _complaintIdentity = "Report on someone else's behalf";
        break;
      case 2: 
        _complaintIdentity = "Report anonymously";
        break;
    }
    notifyListeners();
  }

  void onChangedDropdownValue(String value) {
    _chosenValue = value;
    notifyListeners();
  }

  int get radioValue => _radioValue;
  String get complaintIdentity => _complaintIdentity;
  String get chosenDropdownValue => _chosenValue;
  List<DropdownMenuItem<String>> get dropdownItems => _items;
}