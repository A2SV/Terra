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

  @override
  List<Object?> get props =>
      [officeSpaceType, meetingRoomsAvailable, receptionAreaAvailable];

}
