import 'package:equatable/equatable.dart';

class Amenity extends Equatable {
  final String amenityName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Amenity({
    required this.amenityName,
    this.createdAt,
    this.updatedAt,
  });

  Amenity copyWith({
    String? amenityName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Amenity(
      amenityName: amenityName ?? this.amenityName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Amenity.fromJson(Map<String, dynamic> json) {
    return Amenity(
      amenityName: json['amenityName'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amenityName': amenityName,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [amenityName, createdAt, updatedAt];
}