class WarehouseDto {
  final int ceilingHeight;
  final bool loadingDockAvailable;
  final bool officeSpaceAvailable;
  final List<int> suitableGoods;

  WarehouseDto({
    required this.ceilingHeight,
    required this.loadingDockAvailable,
    required this.officeSpaceAvailable,
    required this.suitableGoods,
  });

  // from json
  
}
