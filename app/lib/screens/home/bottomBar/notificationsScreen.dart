import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {

  static String id = "NotificationsScreen";

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications"),),
    );
  }
}