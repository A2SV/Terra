import 'package:equatable/equatable.dart';

import 'enums.dart';

class StudentHostel extends Equatable {
  final List<StudentHostelRoomTypes>? roomTypes;
  final StudentHostelType hostelType;
  final StudentHostelLocation hostelLocation;
  final bool sharedFacilities;
  final bool mealPlanAvailable;
  final bool studyAreaAvailable;
  final bool laundryFacilityAvailable;
  final bool cleaningServiceAvailable;

  const StudentHostel({
    this.roomTypes,
    required this.hostelType,
    required this.hostelLocation,
    required this.sharedFacilities,
    required this.mealPlanAvailable,
    required this.studyAreaAvailable,
    required this.laundryFacilityAvailable,
    required this.cleaningServiceAvailable,
  });

  @override
  List<Object?> get props => [
        roomTypes,
        hostelType,
        hostelLocation,
        sharedFacilities,
        mealPlanAvailable,
        studyAreaAvailable,
        laundryFacilityAvailable,
        cleaningServiceAvailable,
      ];
}
