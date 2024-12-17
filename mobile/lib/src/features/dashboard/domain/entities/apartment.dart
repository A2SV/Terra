import 'package:equatable/equatable.dart';

class Apartment extends Equatable {
  final int numberOfFloorsInBuilding;
  final int floorNumberOfUnit;
  final bool laundryFacilityAvailable;
  final bool cleaningServiceAvailable;
  final bool studentFriendly;

  const Apartment({
    required this.numberOfFloorsInBuilding,
    required this.floorNumberOfUnit,
    required this.laundryFacilityAvailable,
    required this.cleaningServiceAvailable,
    required this.studentFriendly,
  });

  Apartment copyWith({
    int? numberOfFloorsInBuilding,
    int? floorNumberOfUnit,
    bool? laundryFacilityAvailable,
    bool? cleaningServiceAvailable,
    bool? studentFriendly,
  }) {
    return Apartment(
      numberOfFloorsInBuilding:
          numberOfFloorsInBuilding ?? this.numberOfFloorsInBuilding,
      floorNumberOfUnit: floorNumberOfUnit ?? this.floorNumberOfUnit,
      laundryFacilityAvailable:
          laundryFacilityAvailable ?? this.laundryFacilityAvailable,
      cleaningServiceAvailable:
          cleaningServiceAvailable ?? this.cleaningServiceAvailable,
      studentFriendly: studentFriendly ?? this.studentFriendly,
    );
  }

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      numberOfFloorsInBuilding: json['numberOfFloorsInBuilding'],
      floorNumberOfUnit: json['floorNumberOfUnit'],
      laundryFacilityAvailable: json['laundryFacilityAvailable'],
      cleaningServiceAvailable: json['cleaningServiceAvailable'],
      studentFriendly: json['studentFriendly'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numberOfFloorsInBuilding': numberOfFloorsInBuilding,
      'floorNumberOfUnit': floorNumberOfUnit,
      'laundryFacilityAvailable': laundryFacilityAvailable,
      'cleaningServiceAvailable': cleaningServiceAvailable,
      'studentFriendly': studentFriendly,
    };
  }

  @override
  List<Object?> get props => [
        numberOfFloorsInBuilding,
        floorNumberOfUnit,
        laundryFacilityAvailable,
        cleaningServiceAvailable,
        studentFriendly,
      ];
}