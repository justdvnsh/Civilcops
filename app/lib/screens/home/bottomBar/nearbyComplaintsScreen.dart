import 'package:flutter/material.dart';

class NearbyComplaintsScreen extends StatefulWidget {

  static String id = "NearbyComplaintsScreen";

  @override
  _NearbyComplaintsScreenState createState() => _NearbyComplaintsScreenState();
}

class _NearbyComplaintsScreenState extends State<NearbyComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Neaby Complaints"),),
    );
  }
}