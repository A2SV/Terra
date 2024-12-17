import 'package:mobile/src/features/dashboard/domain/domain.dart';

class ShopModel extends Shop {
  const ShopModel({
    required super.displayWindowAvailable,
    required super.storageRoomSize,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      displayWindowAvailable: json['displayWindowAvailable'],
      storageRoomSize: (json['storageRoomSize'] as num).toDouble(),
    );
  }

  ShopModel copyWith({
    bool? displayWindowAvailable,
    double? storageRoomSize,
  }) {
    return ShopModel(
      displayWindowAvailable:
          displayWindowAvailable ?? this.displayWindowAvailable,
      storageRoomSize: storageRoomSize ?? this.storageRoomSize,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayWindowAvailable': displayWindowAvailable,
      'storageRoomSize': storageRoomSize,
    };
  }
}
