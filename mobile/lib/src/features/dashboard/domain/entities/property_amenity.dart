class PropertyAmenity {
  final String amenityName;
  final DateTime createdAt;
  final DateTime updatedAt;

  PropertyAmenity({
    required this.amenityName,
    required this.createdAt,
    required this.updatedAt,
  });
  // from Json,
  factory PropertyAmenity.fromJson(Map<String, dynamic> json) {
    return PropertyAmenity(
      amenityName: json['amenityName'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
  // to Json,
  Map<String, dynamic> toJson() {
    return {
      'amenityName': amenityName,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
