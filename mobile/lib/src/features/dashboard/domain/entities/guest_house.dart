import 'package:equatable/equatable.dart';

class GuestHouse extends Equatable {
  final int starRating;
  final bool restaurantOnSite;

  const GuestHouse({
    required this.starRating,
    required this.restaurantOnSite,
  });

  factory GuestHouse.fromJson(Map<String, dynamic> json) {
    return GuestHouse(
      starRating: json['starRating'],
      restaurantOnSite: json['restaurantOnSite'],
    );
  }

  @override
  List<Object?> get props => [starRating, restaurantOnSite];

  GuestHouse copyWith({
    int? starRating,
    bool? restaurantOnSite,
  }) {
    return GuestHouse(
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
