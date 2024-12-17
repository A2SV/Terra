import 'package:geolocator/geolocator.dart';

abstract class LocationDataSource {
  Future<LocationPermission> checkPermission();
  Future<LocationPermission> requestPermission();
  Future<Position> getCurrentLocation();
}

class LocationDataSourceImpl implements LocationDataSource {
  @override
  Future <LocationPermission> checkPermission() async{
    return await Geolocator.checkPermission();
  }
  @override
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
}
