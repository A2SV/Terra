import 'package:equatable/equatable.dart';

class PropertyLocation extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String streetName;
  final String houseNumber;
  final String city;
  final String country;
  final String zipCode;
  final double longitude;
  final double latitude;

  const PropertyLocation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.streetName,
    required this.houseNumber,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        streetName,
        houseNumber,
        city,
        country,
        zipCode,
        longitude,
        latitude,
      ];
}
