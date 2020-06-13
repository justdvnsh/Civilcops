import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/screens/home/bottomBar/myComplaintsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/nearbyComplaintsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/notificationsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/profileScreen.dart';
import 'package:civilcops/screens/home/bottomBar/reportScreen.dart';
import 'package:flutter/cupertino.dart';

class MainScreenViewModel extends ChangeNotifier {
  int _index = 0;
  String _titleText = "Report Your Complaints";
  Widget _currentPage = null;

  void setPage(int index, User user) {
    _index = index;
    switch(_index) {
      case 0:
        _currentPage = MyComplaintsScreen();
        break;
      case 1:
        _currentPage = NearbyComplaintsScreen();
        break;
      case 2:
        _currentPage = ReportScreen(user: user);
        break;
      case 3:
        _currentPage = NotificationsScreen();
        break;
      case 4:
        _currentPage = UserProfileScreen();
        break;
    }
    setTitle();
    notifyListeners();
  }

  String setTitle() {
    switch(_index) {
      case 0:
        return "My Complaints";
        break;
      case 1:
        return "Nearby Complaints";
        break;
      case 2:
        return "Report Your Complaints";
        break;
      case 3:
        return "Notifications";
        break;
      case 4:
        return "User Profile";
        break;
    }
    notifyListeners();
  }

  int get index => _index;
  Widget get currentPage => _index == 0 ? MyComplaintsScreen() : _currentPage;
  String get appbarTitle => setTitle();
}