import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/data/models/models.dart';
import 'package:mobile/src/features/dashboard/data/models/property_photo.dart';
import 'package:mobile/src/features/dashboard/data/models/property_video.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';
import 'package:mobile/src/features/dashboard/domain/entities/commercial_property.dart';
import 'package:mobile/src/features/dashboard/domain/entities/property_amenity.dart';

class ListingEntity extends Equatable {
  final String id;
  final String listerId;
  final String paymentInformationId;
  final String propertyLocationId;
  final String title;
  final String description;
  final PropertyType propertyType;
  final PropertySubType propertySubType;
  final PropertyListingType listingType;
  final PropertyPublishStatus propertyPublishStatus;
  final PropertyMarketStatus propertyMarketStatus;
  final int propertySize;
  final DateTime availableStartDate;
  final DateTime availableEndDate;
  // final ListerModel lister;
  final PaymentInformationModel paymentInformation;
  final PropertyLocationModel propertyLocation;

  final List<PropertyPhotoModel> propertyPhotos;
  final List<PropertyVideoModel> propertyVideos;

  final List<PropertyAmenity> propertyAmenities;
  final CommercialProperty commercialProperty;
  // final ResidentialProperty? residentialProperty;

  const ListingEntity({
    required this.id,
    required this.listerId,
    required this.paymentInformationId,
    required this.propertyLocationId,
    required this.title,
    required this.description,
    required this.propertyType,
    required this.listingType,
    required this.propertyPublishStatus,
    required this.propertyMarketStatus,
    required this.propertySize,
    required this.availableStartDate,
    required this.propertySubType,
    required this.availableEndDate,
    // required this.lister,
    required this.paymentInformation,
    required this.propertyLocation,
    required this.propertyPhotos,
    required this.propertyVideos,
    required this.propertyAmenities,
    required this.commercialProperty,
    // required this.residentialProperty,
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
        listingType,
        propertyPublishStatus,
        propertyMarketStatus,
        propertySize,
        propertySubType,
        availableStartDate,
        availableEndDate,
        // lister,
        paymentInformation,
        propertyLocation,
        propertyPhotos,
        propertyVideos,
        propertyAmenities,
        commercialProperty,
        // residentialProperty,
      ];
}
