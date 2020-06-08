import 'package:civilcops/business_logic/viewmodels/home/register_complaint_viewmodel.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/screens/widgets/scroll.dart';
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

  static RegisterComplaintViewModel model = serviceLocator<RegisterComplaintViewModel>();

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
                          steps: model.steps,
                          currentStep: model.currentSteps,
                          onStepContinue: model.next(),
                          onStepCancel: model.cancel(),
                          onStepTapped: (step) => model.goTo(step),
                        ),
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