import 'package:mobile/src/features/dashboard/data/models/models.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class ListingModel extends ListingEntity {
  const ListingModel(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.listerId,
      required super.paymentInformationId,
      required super.propertyLocationId,
      required super.title,
      required super.description,
      required super.propertyType,
      required super.listingType,
      required super.propertyPublishStatus,
      required super.propertyMarketStatus,
      required super.propertySize,
      required super.availableStartDate,
      required super.availableEndDate,
      required super.lister,
      required super.paymentInformation,
      required super.propertyLocation});
  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      listerId: json['listerId'],
      paymentInformationId: json['paymentInformationId'],
      propertyLocationId: json['propertyLocationId'],
      title: json['title'],
      description: json['description'],
      propertyType: PropertyType.values[json['propertyType']],
      listingType: PropertyListingType.values[json['listingType']],
      propertyPublishStatus:
          PropertyPublishStatus.values[json['publishStatus']],
      propertyMarketStatus: PropertyMarketStatus.values[json['marketStatus']],
      propertySize: json['propertySize'],
      availableStartDate: DateTime.parse(json['availableStartDate']),
      availableEndDate: DateTime.parse(json['availableEndDate']),
      lister: ListerModel.fromJson(json['lister']),
      paymentInformation:
          PaymentInformationModel.fromJson(json['paymentInformation']),
      propertyLocation:
          PropertyLocationModel.fromJson(json['propertyLocation']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'listerId': listerId,
      'paymentInformationId': paymentInformationId,
      'propertyLocationId': propertyLocationId,
      'title': title,
      'description': description,
      'propertyType': propertyType.index,
      'listingType': listingType.index,
      'publishStatus': propertyPublishStatus.index,
      'marketStatus': propertyMarketStatus.index,
      'propertySize': propertySize,
      'availableStartDate': availableStartDate.toIso8601String(),
      'availableEndDate': availableEndDate.toIso8601String(),
      'lister': lister.toJson(),
      'paymentInformation': paymentInformation.toJson(),
      'propertyLocation': propertyLocation.toJson(),
    };
  }
}
