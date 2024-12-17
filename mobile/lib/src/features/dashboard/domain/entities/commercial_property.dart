import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class CommercialProperty extends Equatable {
  final int totalFloors;
  final bool parkingSpace;
  final int floorNumber;
  final EventSpace? eventSpace;
  final OfficeSpace? officeSpace;
  final Shop? shop;
  final Warehouse? warehouse;

  const CommercialProperty({
    required this.totalFloors,
    required this.parkingSpace,
    required this.floorNumber,
    this.eventSpace,
    this.officeSpace,
    this.shop,
    this.warehouse,
  });
  @override
  List<Object?> get props => [
        totalFloors,
        parkingSpace,
        floorNumber,
        eventSpace,
        officeSpace,
        shop,
        warehouse,
      ];
}
