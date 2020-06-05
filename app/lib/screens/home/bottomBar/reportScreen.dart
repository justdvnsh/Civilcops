import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {

  static String id = "ReportScreen";

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.arrow_back_ios, size: 32),
                  SizedBox(width: 10,),
                  Text("Report Your Complaint", style: TextStyle(fontSize: 24),),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Choose Complaint Identity",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}