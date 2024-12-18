import 'package:mobile/src/features/dashboard/domain/domain.dart';

class WarehouseModel extends Warehouse {
  const WarehouseModel({
    required super.ceilingHeight,
    required super.loadingDockAvailable,
    required super.officeSpaceAvailable,
    super.suitableGoods,
  });

  factory WarehouseModel.fromJson(Map<String, dynamic> json) {
    return WarehouseModel(
      ceilingHeight: (json['ceilingHeight'] as num).toDouble(),
      loadingDockAvailable: json['loadingDockAvailable'],
      officeSpaceAvailable: json['officeSpaceAvailable'],
      suitableGoods: json['suitableGoods'] != null
          ? (json['suitableGoods'] as List)
              .map((e) => WarehouseSuitableGoods.values
                  .firstWhere((type) => type.name == e))
              .toList()
          : null,
    );
  }
  WarehouseModel copyWith({
    double? ceilingHeight,
    bool? loadingDockAvailable,
    bool? officeSpaceAvailable,
    List<WarehouseSuitableGoods>? suitableGoods,
  }) {
    return WarehouseModel(
      ceilingHeight: ceilingHeight ?? this.ceilingHeight,
      loadingDockAvailable: loadingDockAvailable ?? this.loadingDockAvailable,
      officeSpaceAvailable: officeSpaceAvailable ?? this.officeSpaceAvailable,
      suitableGoods: suitableGoods ?? this.suitableGoods,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ceilingHeight': ceilingHeight,
      'loadingDockAvailable': loadingDockAvailable,
      'officeSpaceAvailable': officeSpaceAvailable,
      'suitableGoods': suitableGoods?.map((e) => e.name).toList(),
    };
  }
}
