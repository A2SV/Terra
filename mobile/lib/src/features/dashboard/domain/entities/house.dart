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

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      numberOfStories: json['numberOfStories'],
      garageSpace: json['garageSpace'].toDouble(),
      studentFriendly: json['studentFriendly'],
    );
  }

  @override
  List<Object?> get props => [numberOfStories, garageSpace, studentFriendly];

  House copyWith({
    int? numberOfStories,
    double? garageSpace,
    bool? studentFriendly,
  }) {
    return House(
      numberOfStories: numberOfStories ?? this.numberOfStories,
      garageSpace: garageSpace ?? this.garageSpace,
      studentFriendly: studentFriendly ?? this.studentFriendly,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numberOfStories': numberOfStories,
      'garageSpace': garageSpace,
      'studentFriendly': studentFriendly,
    };
  }
}
