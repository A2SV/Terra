import 'package:mobile/src/features/dashboard/domain/domain.dart';

class GuestHouseModel extends GuestHouse {
  const GuestHouseModel({
    required super.starRating,
    required super.restaurantOnSite,
  });

  factory GuestHouseModel.fromJson(Map<String, dynamic> json) {
    return GuestHouseModel(
      starRating: json['starRating'],
      restaurantOnSite: json['restaurantOnSite'],
    );
  }

  GuestHouseModel copyWith({
    int? starRating,
    bool? restaurantOnSite,
  }) {
    return GuestHouseModel(
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
