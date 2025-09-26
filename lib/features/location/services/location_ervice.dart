import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<String> getCityName() async {
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
    Position position = await Geolocator.getCurrentPosition();

    // convert to placemark
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isNotEmpty) {
      return placemarks.first.locality ?? "Unknown city";
    }
    return "City not found";
  }
}
