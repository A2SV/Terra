import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class Warehouse extends Equatable {
  final double ceilingHeight;
  final bool loadingDockAvailable;
  final bool officeSpaceAvailable;
  final List<WarehouseSuitableGoods>? suitableGoods;

  const Warehouse({
    required this.ceilingHeight,
    required this.loadingDockAvailable,
    required this.officeSpaceAvailable,
    this.suitableGoods,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      ceilingHeight: json['ceilingHeight'].toDouble(),
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

  @override
  List<Object?> get props => [
        ceilingHeight,
        loadingDockAvailable,
        officeSpaceAvailable,
        suitableGoods
      ];

  Warehouse copyWith({
    double? ceilingHeight,
    bool? loadingDockAvailable,
    bool? officeSpaceAvailable,
    List<WarehouseSuitableGoods>? suitableGoods,
  }) {
    return Warehouse(
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
