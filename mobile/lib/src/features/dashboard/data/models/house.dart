import 'package:mobile/src/features/dashboard/domain/domain.dart';

class HouseModel extends House {
  const HouseModel({
    required super.numberOfStories,
    required super.garageSpace,
    required super.studentFriendly,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      numberOfStories: json['numberOfStories'],
      garageSpace: json['garageSpace'].toDouble(),
      studentFriendly: json['studentFriendly'],
    );
  }

  @override
  List<Object?> get props => [numberOfStories, garageSpace, studentFriendly];

  HouseModel copyWith({
    int? numberOfStories,
    double? garageSpace,
    bool? studentFriendly,
  }) {
    return HouseModel(
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
