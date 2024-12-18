import 'package:equatable/equatable.dart';

class GuestHouse extends Equatable {
  final int starRating;
  final bool restaurantOnSite;

  const GuestHouse({
    required this.starRating,
    required this.restaurantOnSite,
  });

  @override
  List<Object?> get props => [starRating, restaurantOnSite];
}
