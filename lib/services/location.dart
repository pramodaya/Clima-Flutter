import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double lognitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      latitude = position.latitude;
      lognitude = position.longitude;

    } catch (e) {
      print(e);
    }
  }
}
