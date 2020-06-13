import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/business_logic/viewmodels/home/main_screen_viewmodel.dart';
import 'package:civilcops/screens/widgets/nav_drawer.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {

  static String id = "MainScreen";
  final User user;

  MainScreen({@required this.user});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenViewModel viewModel = serviceLocator<MainScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainScreenViewModel>.value(
      value: viewModel,
      child: Consumer<MainScreenViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            drawer: NavDrawer(
              onPressMyComplaints: () {
                model.setPage(0); 
                Navigator.pop(context);
              },
              onPressLogout: () {
                model.setPage(0); 
                Navigator.pop(context);
              },
              onPressNearbyComplaints: () {
                model.setPage(1); 
                Navigator.pop(context);
              },
              onPressFeedbackScreen: () {
                model.setPage(1); 
                Navigator.pop(context);
              },
              onPressReportScreen: () {
                model.setPage(2); 
                Navigator.pop(context);
              },
              onPressNotificationsScreen: () {
                model.setPage(3); 
                Navigator.pop(context);
              },
              onPressUserProfileScreen: () {
                model.setPage(4); 
                Navigator.pop(context);
              },
              userName: widget.user.getEmail(),
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(model.appbarTitle, style: TextStyle(color: Colors.black, fontSize: 20),),
              iconTheme: new IconThemeData(color: Colors.black),
            ),
            // bottomNavigationBar: Container(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   height: 80,
            //   width: size.width,
            //   color: Colors.grey[50],
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: <Widget>[
            //       BottomNavItem(
            //         title: "My Complaints",
            //         icon: FontAwesomeIcons.fileAlt,
            //         press: () => model.setPage(0),
            //         isActive: model.index == 0 ? true : false,
            //       ),
            //       BottomNavItem(
            //         title: "Nearby Complaints",
            //         icon: FontAwesomeIcons.compass,
            //         press: () => model.setPage(1),
            //         isActive: model.index == 1 ? true : false,
            //       ),
            //       BottomNavItem(
            //         title: "Report",
            //         icon: FontAwesomeIcons.plusCircle,
            //         press: () => model.setPage(2),
            //         isActive: model.index == 2 ? true : false,
            //       ),
            //       BottomNavItem(
            //         title: "Notifications",
            //         icon: FontAwesomeIcons.bell,
            //         press: () => model.setPage(3),
            //         isActive: model.index == 3 ? true : false,
            //       ),
            //       BottomNavItem(
            //         title: "User Profile",
            //         icon: FontAwesomeIcons.user,
            //         press: () => model.setPage(4),
            //         isActive: model.index == 4 ? true : false,
            //       ),
            //     ],
            //   ),
            // ),  
            body: model.currentPage
          );
        },
      ),
    );
  }
}