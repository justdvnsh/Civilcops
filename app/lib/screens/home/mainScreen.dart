import 'package:civilcops/business_logic/viewmodels/home/main_screen_viewmodel.dart';
import 'package:civilcops/screens/home/bottomBar/myComplaintsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/nearbyComplaintsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/notificationsScreen.dart';
import 'package:civilcops/screens/home/bottomBar/profileScreen.dart';
import 'package:civilcops/screens/home/bottomBar/reportScreen.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {

  static String id = "MainScreen";
  LatLng latlng;
  String currentLocationString;

  MainScreen({@required this.latlng, this.currentLocationString});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  List<Widget> _children = <Widget>[
    MyComplaintsScreen(),
    NearbyComplaintsScreen(),
    ReportScreen(),
    NotificationsScreen(),
    UserProfileScreen(),
  ];

  MainScreenViewModel viewModel = serviceLocator<MainScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<MainScreenViewModel>.value(
      value: viewModel,
      child: Consumer<MainScreenViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal[500],
              child: const Icon(Icons.add), onPressed: () {model.setPage(2);},),
            bottomNavigationBar: BottomAppBar(
              elevation: 35,
              shape: CircularNotchedRectangle(),
              notchMargin: 4.0,
              child: Container(
                height: size.height * 0.08,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(FontAwesomeIcons.fileAlt, size: 38), onPressed: () {model.setPage(0);},),
                    IconButton(icon: Icon(FontAwesomeIcons.compass, size: 38,), onPressed: () {model.setPage(1);},),
                    // IconButton(icon: Icon(FontAwesomeIcons.plus, size: 38, color: Colors.teal[500],), onPressed: () {model.setPage(2);},),
                    IconButton(icon: Icon(FontAwesomeIcons.bell, size: 38), onPressed: () {model.setPage(3);},),
                    IconButton(icon: Icon(FontAwesomeIcons.user, size: 38), onPressed: () {model.setPage(4);},),
                  ],
                ),
              ),
            ),  
            body: PageView(
              controller: model.currentPage,
              children: _children,
              physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
            ),
          );
        },
      ),
    );
  }
}