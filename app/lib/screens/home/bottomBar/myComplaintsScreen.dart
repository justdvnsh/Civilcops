import 'package:flutter/material.dart';

class MyComplaintsScreen extends StatefulWidget {

  static String id = "MyComplaintsScreen";

  @override
  _MyComplaintsScreenState createState() => _MyComplaintsScreenState();
}

class _MyComplaintsScreenState extends State<MyComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Complaints"),),
    );
  }
}