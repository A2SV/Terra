import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/data/models/media.dart';

import 'entities.dart';

class ListingDetailEntity extends Equatable {
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
  final String propertySize;
  final DateTime availableStartDate;
  final DateTime availableEndDate;
  final Lister lister;
  final PaymentInformation paymentInformation;
  final PropertyLocation propertyLocation;
  final List<MediaModel> propertyPhotos;
  final List<MediaModel> propertyVideos;

  const ListingDetailEntity({
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
    required this.availableEndDate,
    required this.lister,
    required this.paymentInformation,
    required this.propertyLocation,
    required this.propertySubType,
    required this.propertyPhotos,
    required this.propertyVideos,
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
        availableStartDate,
        availableEndDate,
        lister,
        paymentInformation,
        propertyLocation,
        propertySubType,
        propertyPhotos,
        propertyVideos,
      ];
}
