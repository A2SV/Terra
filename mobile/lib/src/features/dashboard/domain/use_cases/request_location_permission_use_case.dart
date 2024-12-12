import 'package:geolocator/geolocator.dart';

class RequestLocationPermissionUseCase {
  Future<bool> call() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }
}
