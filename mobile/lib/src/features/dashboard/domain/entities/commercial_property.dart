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

  factory CommercialProperty.fromJson(Map<String, dynamic> json) {
    return CommercialProperty(
      totalFloors: json['totalFloors'],
      parkingSpace: json['parkingSpace'],
      floorNumber: json['floorNumber'],
      eventSpace: json['eventSpace'] != null
          ? EventSpace.fromJson(json['eventSpace'])
          : null,
      officeSpace: json['officeSpace'] != null
          ? OfficeSpace.fromJson(json['officeSpace'])
          : null,
      shop: json['shop'] != null ? Shop.fromJson(json['shop']) : null,
      warehouse: json['warehouse'] != null
          ? Warehouse.fromJson(json['warehouse'])
          : null,
    );
  }

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

  CommercialProperty copyWith({
    int? totalFloors,
    bool? parkingSpace,
    int? floorNumber,
    EventSpace? eventSpace,
    OfficeSpace? officeSpace,
    Shop? shop,
    Warehouse? warehouse,
  }) {
    return CommercialProperty(
      totalFloors: totalFloors ?? this.totalFloors,
      parkingSpace: parkingSpace ?? this.parkingSpace,
      floorNumber: floorNumber ?? this.floorNumber,
      eventSpace: eventSpace ?? this.eventSpace,
      officeSpace: officeSpace ?? this.officeSpace,
      shop: shop ?? this.shop,
      warehouse: warehouse ?? this.warehouse,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalFloors': totalFloors,
      'parkingSpace': parkingSpace,
      'floorNumber': floorNumber,
      'eventSpace': eventSpace?.toJson(),
      'officeSpace': officeSpace?.toJson(),
      'shop': shop?.toJson(),
      'warehouse': warehouse?.toJson(),
    };
  }
}
