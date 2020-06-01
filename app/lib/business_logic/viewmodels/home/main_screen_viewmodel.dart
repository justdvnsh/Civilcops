import 'package:flutter/cupertino.dart';

class MainScreenViewModel extends ChangeNotifier {
  PageController _myPage = PageController(initialPage: 0);

  void setPage(int index) {
    _myPage.jumpToPage(index);
    notifyListeners();
  }

  PageController get currentPage => _myPage;
}