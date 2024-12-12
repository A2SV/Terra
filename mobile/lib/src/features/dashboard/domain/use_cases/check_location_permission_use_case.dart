import 'package:geolocator/geolocator.dart';

class CheckLocationPermissionUseCase {
  Future<bool> call() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }
}
