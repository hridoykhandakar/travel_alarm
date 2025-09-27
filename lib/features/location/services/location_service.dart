import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<String> getCityName() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return "Permission Denied";
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return "Permission permanently denied";
      }

      // get current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.low,
          distanceFilter: 1000,
          timeLimit: Duration(seconds: 10),
        ),
      ).timeout(Duration(seconds: 10));

      // convert to placemark
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isEmpty) {
        throw Exception("no City");
      }

      return placemarks.first.locality ?? "Unknown city";
    } catch (e) {
      return "Location unavailable";
    }
  }
}
