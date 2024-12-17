import 'package:mobile/src/features/dashboard/domain/domain.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required super.starRating,
    required super.restaurantOnSite,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      starRating: json['starRating'],
      restaurantOnSite: json['restaurantOnSite'],
    );
  }

  HotelModel copyWith({
    int? starRating,
    bool? restaurantOnSite,
  }) {
    return HotelModel(
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
