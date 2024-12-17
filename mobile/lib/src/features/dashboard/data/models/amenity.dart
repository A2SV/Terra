import 'package:mobile/src/features/dashboard/domain/domain.dart';

class AmenityModel extends Amenity {
  const AmenityModel({
    required super.amenityName,
    super.createdAt,
    super.updatedAt,
  });

  factory AmenityModel.fromJson(Map<String, dynamic> json) {
    return AmenityModel(
      amenityName: json['amenityName'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  AmenityModel copyWith({
    String? amenityName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AmenityModel(
      amenityName: amenityName ?? this.amenityName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amenityName': amenityName,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
