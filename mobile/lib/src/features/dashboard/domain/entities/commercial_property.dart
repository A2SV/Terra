import 'package:mobile/src/features/dashboard/domain/entities/warehouseDto.dart';

class CommercialProperty {
  final int totalFloors;
  final bool parkingSpace;
  final int floorNumber;
  final WarehouseDto warehouseDto;

  CommercialProperty({
    required this.totalFloors,
    required this.parkingSpace,
    required this.floorNumber,
    required this.warehouseDto,
  });
  factory CommercialProperty.fromJson(Map<String, dynamic> json) {
    return CommercialProperty(
        totalFloors: 1,
        parkingSpace: true,
        floorNumber: 0,
        warehouseDto: WarehouseDto(
          ceilingHeight: 15,
          loadingDockAvailable: true,
          officeSpaceAvailable: true,
          suitableGoods: [0, 4],
        ));
  }
  // to Json,
  // Map<String, dynamic> toJson() {
  //   return {

  //     'amenityName': amenityName,
  //     'createdAt': createdAt.toIso8601String(),
  //     'updatedAt': updatedAt.toIso8601String(),
  //   };
  // }
}
