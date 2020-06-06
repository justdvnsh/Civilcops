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
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Choose Complaint Identity",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                  ),
                  Text("Report on your behalf", style: TextStyle(color: Colors.black, fontSize: 16),),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                  ),
                  Text("Report on someone else's behalf", style: TextStyle(color: Colors.black, fontSize: 16),),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                  ),
                  Text("Report anonymously", style: TextStyle(color: Colors.black, fontSize: 16),),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Choose Concerned Department",
                  style: TextStyle(
                    fontSize: 18,
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