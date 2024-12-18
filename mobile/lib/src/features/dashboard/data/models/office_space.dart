import 'package:mobile/src/features/dashboard/domain/domain.dart';

class OfficeSpaceModel extends OfficeSpace {
  const OfficeSpaceModel({
    required super.officeSpaceType,
    required super.meetingRoomsAvailable,
    required super.receptionAreaAvailable,
  });

  factory OfficeSpaceModel.fromJson(Map<String, dynamic> json) {
    return OfficeSpaceModel(
      officeSpaceType: OfficeSpaceType.values
          .firstWhere((type) => type.name == json['officeSpaceType']),
      meetingRoomsAvailable: json['meetingRoomsAvailable'],
      receptionAreaAvailable: json['receptionAreaAvailable'],
    );
  }

  OfficeSpaceModel copyWith({
    OfficeSpaceType? officeSpaceType,
    bool? meetingRoomsAvailable,
    bool? receptionAreaAvailable,
  }) {
    return OfficeSpaceModel(
      officeSpaceType: officeSpaceType ?? this.officeSpaceType,
      meetingRoomsAvailable:
          meetingRoomsAvailable ?? this.meetingRoomsAvailable,
      receptionAreaAvailable:
          receptionAreaAvailable ?? this.receptionAreaAvailable,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'officeSpaceType': officeSpaceType.name,
      'meetingRoomsAvailable': meetingRoomsAvailable,
      'receptionAreaAvailable': receptionAreaAvailable,
    };
  }
}
