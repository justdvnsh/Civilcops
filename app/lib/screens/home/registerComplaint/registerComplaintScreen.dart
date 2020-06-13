import 'package:civilcops/business_logic/models/complaints.dart';
import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/business_logic/viewmodels/home/register_complaint_viewmodel.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RegisterComplaintScreen extends StatefulWidget {

  static String id = "RegisterComplaintScreen";
  final Complaint complaint;
  final User user;

  RegisterComplaintScreen({@required this.complaint, this.user});

  @override
  _RegisterComplaintScreenState createState() => _RegisterComplaintScreenState();
}

class _RegisterComplaintScreenState extends State<RegisterComplaintScreen> {

  RegisterComplaintViewModel model = serviceLocator<RegisterComplaintViewModel>();
  static String desc;

  List<Step> _steps = [
    Step(
      title: const Text('Take a Photo'),
      isActive: false,
      state: StepState.indexed,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tap on the Camera to click a picture.",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400]
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.camera, size: 44,),
            onPressed: () {},
          ),
          SizedBox(
            height: 40,
          ),
          CustomButtons(
            buttonText: "Upload From Gallery",
            onPressed: () {},
            textSize: 14,
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.indexed,
      title: const Text('Add  Description'),
      content: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Add Description.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400]
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: "Description",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey)
              ),
              contentPadding: const EdgeInsets.all(40)
            ),
            onChanged: (String val) => desc = val,
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(FontAwesomeIcons.paperclip, size: 20, color: Colors.teal[400],),
              Text("Attach File", style: TextStyle(color: Colors.teal[400]),),
            ],
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.indexed,
      title: const Text('Submit'),
      content: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Complaint Review",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400]
              ),
            ),
          ),
          SizedBox(height: 20,),
          // Container(
          //   decoration: InputDecoration(
          //     hintText: "Description",
          //     focusedBorder: OutlineInputBorder(
          //       borderSide: const BorderSide(color: Colors.grey)
          //     ),
          //     disabledBorder: OutlineInputBorder(
          //       borderSide: const BorderSide(color: Colors.grey)
          //     ),
          //     contentPadding: const EdgeInsets.all(40)
          //   ),
          //   child: Text(widget.complaint.getDescription()),
          // ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(FontAwesomeIcons.paperclip, size: 20, color: Colors.teal[400],),
              Text("Attach File", style: TextStyle(color: Colors.teal[400]),),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return buildView(model);
  }

  Widget buildView(RegisterComplaintViewModel viewmodel) {
    return ChangeNotifierProvider.value(
      value: viewmodel,
      child: Consumer<RegisterComplaintViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.arrow_back_ios, size: 32), onPressed: () => Navigator.pop(context),),
                            SizedBox(width: 10,),
                            Text("Report Your Complaint", style: TextStyle(fontSize: 24),),
                          ],
                        ),
                        SizedBox(height: 10),
                        Stepper(
                          type: StepperType.vertical,
                          steps: _steps,
                          currentStep: model.currentSteps,
                          onStepContinue: model.next(_steps.length),
                          onStepCancel: model.cancel(),
                          onStepTapped: (step) => model.goTo(step),
                          controlsBuilder: (BuildContext context,
                              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                            return SizedBox();
                          },
                        ),
                        model.currentSteps == 1 ? 
                        CustomButtons(
                          buttonText: "Submit",
                          onPressed: () {
                            widget.complaint.concernedDept = "technical";
                            widget.complaint.attachment = "google.com";
                            widget.complaint.imageUrl = "google.com";
                            widget.complaint.status = "unassigned";
                            widget.complaint.description = "something";
                            model.submit(context: context, complaint: widget.complaint, user: widget.user);
                          },
                          textSize: 14,
                        ) : SizedBox()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}