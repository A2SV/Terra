import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class OfficeSpace extends Equatable {
  final OfficeSpaceType officeSpaceType;
  final bool meetingRoomsAvailable;
  final bool receptionAreaAvailable;

  const OfficeSpace({
    required this.officeSpaceType,
    required this.meetingRoomsAvailable,
    required this.receptionAreaAvailable,
  });

  factory OfficeSpace.fromJson(Map<String, dynamic> json) {
    return OfficeSpace(
      officeSpaceType: OfficeSpaceType.values
          .firstWhere((type) => type.name == json['officeSpaceType']),
      meetingRoomsAvailable: json['meetingRoomsAvailable'],
      receptionAreaAvailable: json['receptionAreaAvailable'],
    );
  }

  @override
  List<Object?> get props =>
      [officeSpaceType, meetingRoomsAvailable, receptionAreaAvailable];

  OfficeSpace copyWith({
    OfficeSpaceType? officeSpaceType,
    bool? meetingRoomsAvailable,
    bool? receptionAreaAvailable,
  }) {
    return OfficeSpace(
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
