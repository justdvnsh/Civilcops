import 'package:civilcops/business_logic/models/complaints.dart';
import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/business_logic/viewmodels/home/report_screen_viewmodel.dart';
import 'package:civilcops/screens/home/registerComplaint/registerComplaintScreen.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/screens/widgets/scroll.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {

  static String id = "ReportScreen";
  final User user;

  ReportScreen({@required this.user});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  Complaint complaint = Complaint();
  ReportScreenViewModel model = serviceLocator<ReportScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return buildView(model);
  }

  Widget buildView(ReportScreenViewModel viewModel) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ReportScreenViewModel>(
        builder: (context, model, child){
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Scroll(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                            groupValue: model.radioValue,
                            onChanged: (val) => model.handleRadioValueChanged(val),
                          ),
                          Text("Report on your behalf", style: TextStyle(color: Colors.black, fontSize: 16),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: model.radioValue,
                            onChanged: (val) => model.handleRadioValueChanged(val),
                          ),
                          Text("Report on someone else's behalf", style: TextStyle(color: Colors.black, fontSize: 16),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: model.radioValue,
                            onChanged: (val) => model.handleRadioValueChanged(val),
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
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                        ),
                        // child: DropdownButton<String>(
                        //   value: model.chosenDropdownValue,
                        //   underline: Container(),
                        //   icon: Icon(Icons.arrow_drop_down),
                        //   iconEnabledColor: Colors.blue,
                        //   items: ['Google', 'Apple', 'Amazon', 'Tesla']
                        //   .map<DropdownMenuItem<String>>((String value) {
                        //     return DropdownMenuItem<String>(
                        //       value: value,
                        //       child: Text(value),
                        //     );
                        //   }).toList(),
                        //   onChanged: (val) => model.onChangedDropdownValue(val),
                        // ),
                      ),
                      SizedBox(height:20),
                      CustomButtons(
                        buttonText: "Proceed",
                        onPressed: () {
                          if ( model.complaintIdentity.isEmpty ) {
                            Fluttertoast.showToast(msg: "Choose a complaint identity");
                          } else {
                            complaint.complaintIdentity = model.complaintIdentity;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterComplaintScreen(complaint: complaint, user: widget.user)));
                            Fluttertoast.showToast(msg: model.complaintIdentity);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}