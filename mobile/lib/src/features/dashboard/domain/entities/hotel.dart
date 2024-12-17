import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final int starRating;
  final bool restaurantOnSite;

  const Hotel({
    required this.starRating,
    required this.restaurantOnSite,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      starRating: json['starRating'],
      restaurantOnSite: json['restaurantOnSite'],
    );
  }

  @override
  List<Object?> get props => [starRating, restaurantOnSite];

  Hotel copyWith({
    int? starRating,
    bool? restaurantOnSite,
  }) {
    return Hotel(
      starRating: starRating ?? this.starRating,
      restaurantOnSite: restaurantOnSite ?? this.restaurantOnSite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'starRating': starRating,
      'restaurantOnSite': restaurantOnSite,
    };
  }
}
