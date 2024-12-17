import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';
import 'package:mobile/src/features/dashboard/domain/entities/media.dart';

class ListingDetailEntity extends Equatable {
  final String id;
  final String listerId;
  final String paymentInformationId;
  final String propertyLocationId;
  final String title;
  final String? description;
  final PropertyType propertyType;
  final PropertySubType propertySubType;
  final PropertyPublishStatus publishStatus;
  final PropertyMarketStatus marketStatus;
  final PropertyListingType listingType;
  final double? propertySize;
  final DateTime? availableStartDate;
  final DateTime? availableEndDate;
  final Lister lister;
  final PaymentInformation paymentInformation;
  final PropertyLocation propertyLocation;
  final List<Media>? propertyPhotos;
  final List<Media>? propertyVideos;
  final List<Amenity>? propertyAmenities;
  final CommercialProperty? commercialProperty;
  final ResidentialProperty? residentialProperty;

  const ListingDetailEntity({
    required this.id,
    required this.listerId,
    required this.paymentInformationId,
    required this.propertyLocationId,
    required this.title,
    this.description,
    required this.propertyType,
    required this.propertySubType,
    this.publishStatus = PropertyPublishStatus.unpublished,
    this.marketStatus = PropertyMarketStatus.unavailable,
    required this.listingType,
    this.propertySize,
    this.availableStartDate,
    this.availableEndDate,
    required this.lister,
    required this.paymentInformation,
    required this.propertyLocation,
    this.propertyPhotos,
    this.propertyVideos,
    this.propertyAmenities,
    this.commercialProperty,
    this.residentialProperty,
  });

  

  @override
  List<Object?> get props => [
        id,
        listerId,
        paymentInformationId,
        propertyLocationId,
        title,
        description,
        propertyType,
        propertySubType,
        publishStatus,
        marketStatus,
        listingType,
        propertySize,
        availableStartDate,
        availableEndDate,
        lister,
        paymentInformation,
        propertyLocation,
        propertyPhotos,
        propertyVideos,
        propertyAmenities,
        commercialProperty,
        residentialProperty,
      ];

  
}
