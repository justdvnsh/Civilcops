import 'package:civilcops/screens/home/bottomBar/myComplaintsScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavDrawer extends StatelessWidget {

  Function onPressMyComplaints;
  Function onPressNearbyComplaints;
  Function onPressReportScreen;
  Function onPressNotificationsScreen;
  Function onPressUserProfileScreen;
  Function onPressFeedbackScreen;
  Function onPressLogout;
  String userEmail;

  NavDrawer({@required this.onPressMyComplaints, this.onPressNearbyComplaints, this.onPressReportScreen,
  this.onPressNotificationsScreen, this.onPressUserProfileScreen, this.onPressFeedbackScreen, this.onPressLogout, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: this.onPressUserProfileScreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(),
                    Text(this.userEmail),
                    Icon(Icons.arrow_right),
                  ],
                ),
              )
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/civilcops.png'))),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.file),
            title: Text('My Complaints'),
            onTap: this.onPressMyComplaints
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.compass),
            title: Text('Nearby Complaints'),
            onTap: this.onPressNearbyComplaints
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.plusCircle),
            title: Text('Report'),
            onTap: this.onPressReportScreen
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.bell),
            title: Text('Notifications'),
            onTap: this.onPressNotificationsScreen
          ),
          Expanded(child: Container()),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.userInjured),
            title: Text("Feedback"),
            onTap: this.onPressFeedbackScreen,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.running),
            title: Text("Logout"),
            onTap: this.onPressLogout
          ),
        ],
      ),
    );
  }
}