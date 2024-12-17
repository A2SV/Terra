import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final bool displayWindowAvailable;
  final double storageRoomSize;

  const Shop({
    required this.displayWindowAvailable,
    required this.storageRoomSize,
  });

  @override
  List<Object?> get props => [displayWindowAvailable, storageRoomSize];
}
