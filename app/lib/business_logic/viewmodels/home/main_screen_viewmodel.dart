import 'package:civilcops/screens/home/bottomBar/myComplaintsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/nearbyComplaintsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/notificationsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/profileScreen.dart';
import 'package:civilcops/screens/home/bottomBar/reportScreen.dart';
import 'package:flutter/cupertino.dart';

class MainScreenViewModel extends ChangeNotifier {
  int _index = 2;

  List<Widget> _children = <Widget>[
    MyComplaintsScreen(),
    NearbyComplaintsScreen(),
    ReportScreen(),
    NotificationsScreen(),
    UserProfileScreen(),
  ];

  void setPage(int index) {
    _index = index;
    notifyListeners();
  }

  int get index => _index;
  Widget get currentPage => _children[_index];
}