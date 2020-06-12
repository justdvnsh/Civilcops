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
  String userName;

  NavDrawer({@required this.onPressMyComplaints, this.onPressNearbyComplaints, this.onPressReportScreen,
  this.onPressNotificationsScreen, this.onPressUserProfileScreen, this.onPressFeedbackScreen, this.onPressLogout, this.userName});

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
                    CircleAvatar(backgroundColor: Colors.black,),
                    SizedBox(width: 10,),
                    Text(this.userName),
                    Icon(Icons.arrow_right),
                  ],
                ),
              )
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/women.jpg'))),
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