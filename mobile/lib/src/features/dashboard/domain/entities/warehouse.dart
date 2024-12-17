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
  @override
  List<Object?> get props => [
        ceilingHeight,
        loadingDockAvailable,
        officeSpaceAvailable,
        suitableGoods
      ];
}
