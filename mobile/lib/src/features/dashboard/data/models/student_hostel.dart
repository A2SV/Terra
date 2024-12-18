import 'package:mobile/src/features/dashboard/domain/domain.dart';

class StudentHostelModel extends StudentHostel {
  const StudentHostelModel({
    super.roomTypes,
    required super.hostelType,
    required super.hostelLocation,
    required super.sharedFacilities,
    required super.mealPlanAvailable,
    required super.studyAreaAvailable,
    required super.laundryFacilityAvailable,
    required super.cleaningServiceAvailable,
  });

  factory StudentHostelModel.fromJson(Map<String, dynamic> json) {
    return StudentHostelModel(
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

  StudentHostelModel copyWith({
    List<StudentHostelRoomTypes>? roomTypes,
    StudentHostelType? hostelType,
    StudentHostelLocation? hostelLocation,
    bool? sharedFacilities,
    bool? mealPlanAvailable,
    bool? studyAreaAvailable,
    bool? laundryFacilityAvailable,
    bool? cleaningServiceAvailable,
  }) {
    return StudentHostelModel(
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
