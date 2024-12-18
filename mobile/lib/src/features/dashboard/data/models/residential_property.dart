import 'package:mobile/src/features/dashboard/data/models/models.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class ResidentialPropertyModel extends ResidentialProperty {
  @override
  final ApartmentModel? apartment;

  @override
  final GuestHouseModel? guestHouse;
  @override
  final HouseModel? house;
  @override
  final HotelModel? hotel;
  @override
  final StudentHostelModel? studentHostel;
  const ResidentialPropertyModel({
    required super.furnishedStatus,
    required super.numberOfBedrooms,
    required super.numberOfBathrooms,
    required super.numberOfWashrooms,
    required super.numberOfKitchens,
    this.apartment,
    this.guestHouse,
    this.house,
    this.hotel,
    this.studentHostel,
  });
  factory ResidentialPropertyModel.fromJson(Map<String, dynamic> json) {
    return ResidentialPropertyModel(
      furnishedStatus: json['furnishedStatus'],
      numberOfBedrooms: json['numberOfBedrooms'],
      numberOfBathrooms: json['numberOfBathrooms'],
      numberOfWashrooms: json['numberOfWashrooms'],
      numberOfKitchens: json['numberOfKitchens'],
      apartment: json['apartment'] != null
          ? ApartmentModel.fromJson(json['apartment'])
          : null,
      guestHouse: json['guestHouse'] != null
          ? GuestHouseModel.fromJson(json['guestHouse'])
          : null,
      house: json['house'] != null ? HouseModel.fromJson(json['house']) : null,
      hotel: json['hotel'] != null ? HotelModel.fromJson(json['hotel']) : null,
      studentHostel: json['studentHostel'] != null
          ? StudentHostelModel.fromJson(json['studentHostel'])
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

  ResidentialPropertyModel copyWith({
    bool? furnishedStatus,
    int? numberOfBedrooms,
    int? numberOfBathrooms,
    int? numberOfWashrooms,
    int? numberOfKitchens,
    ApartmentModel? apartment,
    GuestHouseModel? guestHouse,
    HouseModel? house,
    HotelModel? hotel,
    StudentHostelModel? studentHostel,
  }) {
    return ResidentialPropertyModel(
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
