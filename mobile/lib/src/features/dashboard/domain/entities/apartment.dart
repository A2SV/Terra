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

  @override
  List<Object?> get props => [
        numberOfFloorsInBuilding,
        floorNumberOfUnit,
        laundryFacilityAvailable,
        cleaningServiceAvailable,
        studentFriendly,
      ];
}