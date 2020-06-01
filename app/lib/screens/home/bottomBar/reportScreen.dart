import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ReportScreen extends StatefulWidget {

  static String id = "ReportScreen";

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report"),),
    );
  }
}