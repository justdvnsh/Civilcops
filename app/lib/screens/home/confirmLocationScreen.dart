import 'package:civilcops/business_logic/viewmodels/home/confirm_location_viewmodel.dart';
import 'package:civilcops/screens/home/mainScreen.dart';
import 'package:civilcops/screens/shared/progressDialog.dart';
import 'package:civilcops/screens/widgets/buttons.dart';
import 'package:civilcops/screens/widgets/input_box.dart';
import 'package:civilcops/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class ConfirmLocationScreen extends StatefulWidget {

  static String id = "ConfirmLocationScreen";

  @override
  _ConfirmLocationScreenState createState() => _ConfirmLocationScreenState();
}

class _ConfirmLocationScreenState extends State<ConfirmLocationScreen> {
  
  ConfirmLocationViewModel model = serviceLocator<ConfirmLocationViewModel>();

  @override
  void initState() { 
    super.initState();
    model.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildView(model),
    );
  }

  Widget buildView(ConfirmLocationViewModel viewModel) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ConfirmLocationViewModel>.value(
      value: viewModel,
      child: Consumer<ConfirmLocationViewModel>(
        builder: (context, model, child) {
          return Stack(
            children: <Widget>[
              model.initialLatLng == null ? CircularProgressIndicator(backgroundColor: Colors.black) :
              GoogleMap(
                onMapCreated: model.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: model.initialLatLng,
                  zoom: 20
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: size.height * 0.18,
                    color: Colors.teal[50],
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: InputBox(
                            hintText: model.currentLocationString,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            enabled: false,
                            hintTextStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                        ),
                      ),
                    ),
                  ),
                  model.initialLatLng == null ? CircularProgressIndicator() : 
                  Container(
                    height: size.height * 0.115,
                    padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                        child: CustomButtons(
                          buttonText: "CONFIRM LOCATION",
                          textSize: 16,
                          textWeight: FontWeight.bold,
                          onPressed: () {
                            Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context) => MainScreen(latlng: model.initialLatLng, currentLocationString: model.currentLocationString)));
                          },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )
    ); 
  }
}