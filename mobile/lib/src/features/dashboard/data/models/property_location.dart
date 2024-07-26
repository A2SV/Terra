import 'package:mobile/src/features/dashboard/domain/domain.dart';

class PropertyLocationModel extends PropertyLocation {
  const PropertyLocationModel(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.streetName,
      required super.houseNumber,
      required super.city,
      required super.country,
      required super.zipCode,
      required super.longitude,
      required super.latitude});
       factory PropertyLocationModel.fromJson(Map<String, dynamic> json) {
    return PropertyLocationModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      streetName: json['streetName'],
      houseNumber: json['houseNumber'],
      city: json['city'],
      country: json['country'],
      zipCode: json['zipCode'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'streetName': streetName,
      'houseNumber': houseNumber,
      'city': city,
      'country': country,
      'zipCode': zipCode,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}
