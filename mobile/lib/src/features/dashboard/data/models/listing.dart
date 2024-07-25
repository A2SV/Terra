import 'package:mobile/src/features/dashboard/domain/entities/listing.dart';

import '../../domain/entities/enums.dart';

class ListingModel extends ListingEntity {
  const ListingModel({
    required super.listerId,
    required super.title,
    required super.description,
    required super.propertyType,
    required super.listingType,
    required super.propertyPublishStatus,
    required super.propertyMarketStatus,
    required super.propertySize,
    required super.availableStartDate,
    required super.availableEndDate,
    required super.paymentCurrency,
    required super.paymentFrequency,
    required super.price,
    required super.negotiable,
    required super.streetName,
    required super.houseNumber,
    required super.city,
    required super.country,
    required super.zipCode,
    required super.longitude,
    required super.latitude,
    required super.amenities,
    required super.pictures,
    required super.videos,
  });

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      listerId: json['listerId'],
      title: json['title'],
      description: json['description'],
      propertyType: PropertyType.values[json['propertyType']],
      listingType: PropertyListingType.values[json['listingType']],
      propertyPublishStatus:
          PropertyPublishStatus.values[json['propertyPublishStatus']],
      propertyMarketStatus:
          PropertyMarketStatus.values[json['propertyMarketStatus']],
      propertySize: json['propertySize'],
      availableStartDate: DateTime.parse(json['availableStartDate']),
      availableEndDate: DateTime.parse(json['availableEndDate']),
      paymentCurrency: PaymentCurrency.values[json['paymentCurrency']],
      paymentFrequency: PaymentFrequency.values[json['paymentFrequency']],
      price: json['price'].toDouble(),
      negotiable: json['negotiable'],
      streetName: json['streetName'],
      houseNumber: json['houseNumber'],
      city: json['city'],
      country: json['country'],
      zipCode: json['zipCode'],
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
      amenities: List<String>.from(json['amenities']),
      pictures: List<String>.from(json['pictures']),
      videos: List<String>.from(json['videos']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'listerId': listerId,
      'title': title,
      'description': description,
      'propertyType': propertyType.index,
      'listingType': listingType.index,
      'propertyPublishStatus': propertyPublishStatus.index,
      'propertyMarketStatus': propertyMarketStatus.index,
      'propertySize': propertySize,
      'availableStartDate': availableStartDate.toIso8601String(),
      'availableEndDate': availableEndDate.toIso8601String(),
      'paymentCurrency': paymentCurrency.index,
      'paymentFrequency': paymentFrequency.index,
      'price': price,
      'negotiable': negotiable,
      'streetName': streetName,
      'houseNumber': houseNumber,
      'city': city,
      'country': country,
      'zipCode': zipCode,
      'longitude': longitude,
      'latitude': latitude,
      'amenities': amenities,
      'pictures': pictures,
      'videos': videos,
    };
  }
}
