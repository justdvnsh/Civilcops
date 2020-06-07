import 'package:civilcops/business_logic/viewmodels/home/register_complaint_viewmodel.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RegisterComplaintScreen extends StatefulWidget {

  static String id = "RegisterComplaintScreen";

  @override
  _RegisterComplaintScreenState createState() => _RegisterComplaintScreenState();
}

class _RegisterComplaintScreenState extends State<RegisterComplaintScreen> {

  RegisterComplaintViewModel model = serviceLocator<RegisterComplaintViewModel>();

  List<Step> _steps = [
    Step(
      title: const Text('Take A Picture'),
      isActive: true,
      state: StepState.complete,
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
      state: StepState.editing,
      title: const Text('Address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),
    Step(
      state: StepState.error,
      title: const Text('Avatar'),
      subtitle: const Text("Error!"),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
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
                child: Column(
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