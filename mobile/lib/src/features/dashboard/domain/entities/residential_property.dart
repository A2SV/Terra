import 'package:equatable/equatable.dart';

import 'entities.dart';

class ResidentialProperty extends Equatable {
  final bool furnishedStatus;
  final int numberOfBedrooms;
  final int numberOfBathrooms;
  final int numberOfWashrooms;
  final int numberOfKitchens;
  final Apartment? apartment;
  final GuestHouse? guestHouse;
  final House? house;
  final Hotel? hotel;
  final StudentHostel? studentHostel;

  const ResidentialProperty({
    required this.furnishedStatus,
    required this.numberOfBedrooms,
    required this.numberOfBathrooms,
    required this.numberOfWashrooms,
    required this.numberOfKitchens,
    this.apartment,
    this.guestHouse,
    this.house,
    this.hotel,
    this.studentHostel,
  });

  @override
  List<Object?> get props => [
        furnishedStatus,
        numberOfBedrooms,
        numberOfBathrooms,
        numberOfWashrooms,
        numberOfKitchens,
        apartment,
        guestHouse,
        house,
        hotel,
        studentHostel,
      ];
}
