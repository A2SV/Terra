import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final int starRating;
  final bool restaurantOnSite;

  const Hotel({
    required this.starRating,
    required this.restaurantOnSite,
  });

  @override
  List<Object?> get props => [starRating, restaurantOnSite];
}
