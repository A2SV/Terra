import 'package:equatable/equatable.dart';

class House extends Equatable {
  final int numberOfStories;
  final double garageSpace;
  final bool studentFriendly;

  const House({
    required this.numberOfStories,
    required this.garageSpace,
    required this.studentFriendly,
  });

  @override
  List<Object?> get props => [numberOfStories, garageSpace, studentFriendly];
}
