import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterComplaintViewModel extends ChangeNotifier {
  int _currentSteps = 0;
  static bool _complete = false;

  List<Step> _steps = [
    Step(
      title: const Text('Take a Photo'),
      isActive: _complete == true ? true : false,
      state: _complete == true ? StepState.complete : StepState.editing,
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
      isActive: _complete == true ? true : false,
      state: _complete == true ? StepState.complete : StepState.editing,
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
      isActive: _complete == true ? true : false,
      state: _complete == true ? StepState.complete : StepState.editing,
      title: const Text('Submit'),
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


  next() {
    _currentSteps + 1 != _steps.length ? goTo(_currentSteps + 1) : _complete = true;
    notifyListeners();
  }

  goTo(int step) {
    _currentSteps = step;
    _complete = true;
    notifyListeners();
  }

  cancel() {
    if (_currentSteps > 0) {
      goTo(_currentSteps - 1);
    }
    notifyListeners();
  }

  int get currentSteps => _currentSteps;
  bool get complete => _complete;
  List<Step> get steps => _steps;
}