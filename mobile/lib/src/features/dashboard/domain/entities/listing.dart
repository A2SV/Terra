import 'package:equatable/equatable.dart';

import 'enums.dart';

class ListingEntity extends Equatable {
  final String listerId;
  final String title;
  final String description;
  final PropertyType propertyType;
  final PropertyListingType listingType;
  final PropertyPublishStatus propertyPublishStatus;
  final PropertyMarketStatus propertyMarketStatus;
  final int propertySize;
  final DateTime availableStartDate;
  final DateTime availableEndDate;
  final PaymentCurrency paymentCurrency;
  final PaymentFrequency paymentFrequency;
  final double price;
  final bool negotiable;
  final String streetName;
  final String houseNumber;
  final String city;
  final String country;
  final String zipCode;
  final double longitude;
  final double latitude;
  final List<String> amenities;

  const ListingEntity({
    required this.listerId,
    required this.title,
    required this.description,
    required this.propertyType,
    required this.listingType,
    required this.propertyPublishStatus,
    required this.propertyMarketStatus,
    required this.propertySize,
    required this.availableStartDate,
    required this.availableEndDate,
    required this.paymentCurrency,
    required this.paymentFrequency,
    required this.price,
    required this.negotiable,
    required this.streetName,
    required this.houseNumber,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.longitude,
    required this.latitude,
    required this.amenities,
  });

  @override
  List<Object?> get props => [
        listerId,
        title,
        description,
        propertyType,
        listingType,
        propertyPublishStatus,
        propertyMarketStatus,
        propertySize,
        availableStartDate,
        availableEndDate,
        paymentCurrency,
        paymentFrequency,
        price,
        negotiable,
        streetName,
        houseNumber,
        city,
        country,
        zipCode,
        longitude,
        latitude,
        amenities,
      ];
}
