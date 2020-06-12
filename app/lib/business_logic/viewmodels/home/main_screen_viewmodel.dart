import 'package:civilcops/screens/home/bottomBar/myComplaintsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/nearbyComplaintsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/notificationsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/profileScreen.dart';
import 'package:civilcops/screens/home/bottomBar/reportScreen.dart';
import 'package:flutter/cupertino.dart';

class MainScreenViewModel extends ChangeNotifier {
  int _index = 2;
  String _titleText = "Report Your Complaints";

  List<Widget> _children = <Widget>[
    MyComplaintsScreen(),
    NearbyComplaintsScreen(),
    ReportScreen(),
    NotificationsScreen(),
    UserProfileScreen(),
  ];

  void setPage(int index) {
    _index = index;
    setTitle();
    notifyListeners();
  }

  void setTitle() {
    switch(_index) {
      case 0:
        _titleText = "My Complaints";
        break;
      case 1:
        _titleText = "Nearby Complaints";
        break;
      case 2:
        _titleText = "Report Your Complaints";
        break;
      case 3:
        _titleText = "Notifications";
        break;
      case 4:
        _titleText = "User Profile";
        break;
    }
    notifyListeners();
  }

  int get index => _index;
  Widget get currentPage => _children[_index];
  String get appbarTitle => _titleText;
}