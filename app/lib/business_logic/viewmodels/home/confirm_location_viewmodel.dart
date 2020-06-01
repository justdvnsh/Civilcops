import 'package:civilcops/screens/shared/progressDialog.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ConfirmLocationViewModel extends ChangeNotifier {

  GoogleMapController mapController;
  Position currentPosition;
  LatLng _initalLatLng = null;
  String _currentLocationString = "Current Location is being fetched. Please Wait...";

  GoogleMapController onMapCreated(GoogleMapController controller) {
    mapController = controller;
    return mapController;
  }

  void getCurrentLocation() async {
    currentPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    _initalLatLng = LatLng(currentPosition.latitude, currentPosition.longitude);
    getCurrentPlacemarks(currentPosition);
    notifyListeners();
  }

  void getCurrentPlacemarks(Position position) async {
    List<Placemark> placemark = await Geolocator().placemarkFromPosition(position);
    _currentLocationString = "${placemark[0].subThoroughfare}, ${placemark[0].thoroughfare}, ${placemark[0].subLocality}, ${placemark[0].locality}";
    notifyListeners();
  }

  LatLng get initialLatLng => _initalLatLng;
  String get currentLocationString => _currentLocationString;
}