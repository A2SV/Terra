import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/data/models/models.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class ListingEntity extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String listerId;
  final String paymentInformationId;
  final String propertyLocationId;
  final String title;
  final String description;
  final PropertyType propertyType;
  final PropertyListingType listingType;
  final PropertyPublishStatus propertyPublishStatus;
  final PropertyMarketStatus propertyMarketStatus;
  final int propertySize;
  final DateTime availableStartDate;
  final DateTime availableEndDate;
  final ListerModel lister;
  final PaymentInformationModel paymentInformation;
  final PropertyLocationModel propertyLocation;

  const ListingEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
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
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
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
      ];
}
