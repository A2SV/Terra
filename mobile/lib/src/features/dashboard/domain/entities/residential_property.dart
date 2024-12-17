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

  factory ResidentialProperty.fromJson(Map<String, dynamic> json) {
    return ResidentialProperty(
      furnishedStatus: json['furnishedStatus'],
      numberOfBedrooms: json['numberOfBedrooms'],
      numberOfBathrooms: json['numberOfBathrooms'],
      numberOfWashrooms: json['numberOfWashrooms'],
      numberOfKitchens: json['numberOfKitchens'],
      apartment: json['apartment'] != null
          ? Apartment.fromJson(json['apartment'])
          : null,
      guestHouse: json['guestHouse'] != null
          ? GuestHouse.fromJson(json['guestHouse'])
          : null,
      house: json['house'] != null ? House.fromJson(json['house']) : null,
      hotel: json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null,
      studentHostel: json['studentHostel'] != null
          ? StudentHostel.fromJson(json['studentHostel'])
          : null,
    );
  }

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

  ResidentialProperty copyWith({
    bool? furnishedStatus,
    int? numberOfBedrooms,
    int? numberOfBathrooms,
    int? numberOfWashrooms,
    int? numberOfKitchens,
    Apartment? apartment,
    GuestHouse? guestHouse,
    House? house,
    Hotel? hotel,
    StudentHostel? studentHostel,
  }) {
    return ResidentialProperty(
      furnishedStatus: furnishedStatus ?? this.furnishedStatus,
      numberOfBedrooms: numberOfBedrooms ?? this.numberOfBedrooms,
      numberOfBathrooms: numberOfBathrooms ?? this.numberOfBathrooms,
      numberOfWashrooms: numberOfWashrooms ?? this.numberOfWashrooms,
      numberOfKitchens: numberOfKitchens ?? this.numberOfKitchens,
      apartment: apartment ?? this.apartment,
      guestHouse: guestHouse ?? this.guestHouse,
      house: house ?? this.house,
      hotel: hotel ?? this.hotel,
      studentHostel: studentHostel ?? this.studentHostel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'furnishedStatus': furnishedStatus,
      'numberOfBedrooms': numberOfBedrooms,
      'numberOfBathrooms': numberOfBathrooms,
      'numberOfWashrooms': numberOfWashrooms,
      'numberOfKitchens': numberOfKitchens,
      'apartment': apartment?.toJson(),
      'guestHouse': guestHouse?.toJson(),
      'house': house?.toJson(),
      'hotel': hotel?.toJson(),
      'studentHostel': studentHostel?.toJson(),
    };
  }
}
