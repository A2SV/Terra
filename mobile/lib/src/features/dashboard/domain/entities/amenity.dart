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

  @override
  List<Object?> get props => [amenityName, createdAt, updatedAt];
}