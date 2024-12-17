import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final bool displayWindowAvailable;
  final double storageRoomSize;

  const Shop({
    required this.displayWindowAvailable,
    required this.storageRoomSize,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      displayWindowAvailable: json['displayWindowAvailable'],
      storageRoomSize: json['storageRoomSize'].toDouble(),
    );
  }

  @override
  List<Object?> get props => [displayWindowAvailable, storageRoomSize];

  Shop copyWith({
    bool? displayWindowAvailable,
    double? storageRoomSize,
  }) {
    return Shop(
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
