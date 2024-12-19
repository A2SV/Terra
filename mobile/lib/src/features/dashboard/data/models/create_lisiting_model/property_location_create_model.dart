class PropertyLocationCreateModel {
  final String streetName;
  final String houseNumber;
  final String city;
  final String country;
  final String zipCode;
  final double longitude;
  final double latitude;

  const PropertyLocationCreateModel({
    required this.streetName,
    required this.houseNumber,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.longitude,
    required this.latitude,
  });

  PropertyLocationCreateModel copyWith({
    String? streetName,
    String? houseNumber,
    String? city,
    String? country,
    String? zipCode,
    double? longitude,
    double? latitude,
  }) {
    return PropertyLocationCreateModel(
      streetName: streetName ?? this.streetName,
      houseNumber: houseNumber ?? this.houseNumber,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }
}