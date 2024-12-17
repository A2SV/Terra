import 'package:mobile/src/features/dashboard/data/models/models.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class CommercialPropertyModel extends CommercialProperty {
  @override
  final EventSpaceModel? eventSpace;

  @override
  final OfficeSpaceModel? officeSpace;
  @override
  final ShopModel? shop;
  @override
  final WarehouseModel? warehouse;
  
  const CommercialPropertyModel({
    required super.totalFloors,
    required super.parkingSpace,
    required super.floorNumber,
    this.eventSpace,
    this.officeSpace,
    this.shop,
    this.warehouse,
  }) : super(
            eventSpace: eventSpace,
            officeSpace: officeSpace,
            shop: shop,
            warehouse: warehouse);
  factory CommercialPropertyModel.fromJson(Map<String, dynamic> json) {
    return CommercialPropertyModel(
      totalFloors: json['totalFloors'],
      parkingSpace: json['parkingSpace'],
      floorNumber: json['floorNumber'],
      eventSpace: json['eventSpace'] != null
          ? EventSpaceModel.fromJson(json['eventSpace'])
          : null,
      officeSpace: json['officeSpace'] != null
          ? OfficeSpaceModel.fromJson(json['officeSpace'])
          : null,
      shop: json['shop'] != null ? ShopModel.fromJson(json['shop']) : null,
      warehouse: json['warehouse'] != null
          ? WarehouseModel.fromJson(json['warehouse'])
          : null,
    );
  }

  CommercialPropertyModel copyWith({
    int? totalFloors,
    bool? parkingSpace,
    int? floorNumber,
    EventSpaceModel? eventSpace,
    OfficeSpaceModel? officeSpace,
    ShopModel? shop,
    WarehouseModel? warehouse,
  }) {
    return CommercialPropertyModel(
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
