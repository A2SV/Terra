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

  factory StudentHostel.fromJson(Map<String, dynamic> json) {
    return StudentHostel(
      roomTypes: json['roomTypes'] != null
          ? (json['roomTypes'] as List)
              .map((e) => StudentHostelRoomTypes.values
                  .firstWhere((type) => type.name == e))
              .toList()
          : null,
      hostelType: StudentHostelType.values
          .firstWhere((type) => type.name == json['hostelType']),
      hostelLocation: StudentHostelLocation.values
          .firstWhere((loc) => loc.name == json['hostelLocation']),
      sharedFacilities: json['sharedFacilities'],
      mealPlanAvailable: json['mealPlanAvailable'],
      studyAreaAvailable: json['studyAreaAvailable'],
      laundryFacilityAvailable: json['laundryFacilityAvailable'],
      cleaningServiceAvailable: json['cleaningServiceAvailable'],
    );
  }

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

  StudentHostel copyWith({
    List<StudentHostelRoomTypes>? roomTypes,
    StudentHostelType? hostelType,
    StudentHostelLocation? hostelLocation,
    bool? sharedFacilities,
    bool? mealPlanAvailable,
    bool? studyAreaAvailable,
    bool? laundryFacilityAvailable,
    bool? cleaningServiceAvailable,
  }) {
    return StudentHostel(
      roomTypes: roomTypes ?? this.roomTypes,
      hostelType: hostelType ?? this.hostelType,
      hostelLocation: hostelLocation ?? this.hostelLocation,
      sharedFacilities: sharedFacilities ?? this.sharedFacilities,
      mealPlanAvailable: mealPlanAvailable ?? this.mealPlanAvailable,
      studyAreaAvailable: studyAreaAvailable ?? this.studyAreaAvailable,
      laundryFacilityAvailable:
          laundryFacilityAvailable ?? this.laundryFacilityAvailable,
      cleaningServiceAvailable:
          cleaningServiceAvailable ?? this.cleaningServiceAvailable,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomTypes': roomTypes?.map((e) => e.name).toList(),
      'hostelType': hostelType.name,
      'hostelLocation': hostelLocation.name,
      'sharedFacilities': sharedFacilities,
      'mealPlanAvailable': mealPlanAvailable,
      'studyAreaAvailable': studyAreaAvailable,
      'laundryFacilityAvailable': laundryFacilityAvailable,
      'cleaningServiceAvailable': cleaningServiceAvailable,
    };
  }
}
