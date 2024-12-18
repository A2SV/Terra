import 'package:mobile/src/features/dashboard/domain/domain.dart';

class ApartmentModel extends Apartment {
  const ApartmentModel({
    required super.numberOfFloorsInBuilding,
    required super.floorNumberOfUnit,
    required super.laundryFacilityAvailable,
    required super.cleaningServiceAvailable,
    required super.studentFriendly,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      numberOfFloorsInBuilding: json['numberOfFloorsInBuilding'],
      floorNumberOfUnit: json['floorNumberOfUnit'],
      laundryFacilityAvailable: json['laundryFacilityAvailable'],
      cleaningServiceAvailable: json['cleaningServiceAvailable'],
      studentFriendly: json['studentFriendly'],
    );
  }

  ApartmentModel copyWith({
    int? numberOfFloorsInBuilding,
    int? floorNumberOfUnit,
    bool? laundryFacilityAvailable,
    bool? cleaningServiceAvailable,
    bool? studentFriendly,
  }) {
    return ApartmentModel(
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

  Map<String, dynamic> toJson() {
    return {
      'numberOfFloorsInBuilding': numberOfFloorsInBuilding,
      'floorNumberOfUnit': floorNumberOfUnit,
      'laundryFacilityAvailable': laundryFacilityAvailable,
      'cleaningServiceAvailable': cleaningServiceAvailable,
      'studentFriendly': studentFriendly,
    };
  }
}
