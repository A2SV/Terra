import 'package:geolocator/geolocator.dart';
import '../data_sources/location_data_source.dart';

abstract class LocationRepository {
  Future<bool> checkPermission();
  Future<bool> requestPermission();
  Future<Position> getCurrentLocation();
}

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource locationDataSource;

  LocationRepositoryImpl(this.locationDataSource);

  @override
  Future<bool> checkPermission() async {
    final permission = await locationDataSource.checkPermission();
    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }

  @override
  Future<bool> requestPermission() async {
    final permission = await locationDataSource.requestPermission();
    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }

  @override
  Future<Position> getCurrentLocation() async {
    return await locationDataSource.getCurrentLocation();
  }
}
