import 'package:mobile/src/features/dashboard/data/models/media.dart';
import 'package:mobile/src/features/dashboard/data/models/models.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class ListingModel extends ListingEntity {
  const ListingModel(
      {required super.id,
      required super.listerId,
      required super.paymentInformationId,
      required super.propertyLocationId,
      required super.title,
      required super.description,
      required super.propertyType,
      required super.propertySubType,
      required super.listingType,
      required super.propertyPublishStatus,
      required super.propertyMarketStatus,
      required super.propertySize,
      required super.availableStartDate,
      required super.availableEndDate,
      required this.lister_,
      required this.paymentInformation_,
      required this.propertyLocation_,
      required super.propertyPhotos,
      required super.propertyVideos,
      }):super(lister: lister_, paymentInformation: paymentInformation_, propertyLocation: propertyLocation_);
  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      id: json['id'],
      listerId: json['listerId'],
      paymentInformationId: json['paymentInformationId'],
      propertyLocationId: json['propertyLocationId'],
      title: json['title'],
      description: json['description'],
      propertyType: PropertyType.values[json['propertyType']],
      listingType: PropertyListingType.values[json['listingType']],
      propertyPublishStatus: PropertyPublishStatus.values[json['publishStatus']],
      propertyMarketStatus: PropertyMarketStatus.values[json['marketStatus']],
      propertySize: json['propertySize'].toString(),
      availableStartDate: DateTime.parse(json['availableStartDate']),
      availableEndDate: DateTime.parse(json['availableEndDate']),
      lister_: ListerModel.fromJson(json['lister']),
      propertySubType: PropertySubType.values[json['propertySubType']],
      paymentInformation_: PaymentInformationModel.fromJson(json['paymentInformation']),
      propertyLocation_: PropertyLocationModel.fromJson(json['propertyLocation']),
      propertyPhotos: (json['propertyPhotos'] as List<dynamic>).map<MediaModel>((data)=>MediaModel.fromJson(data)).toList(),
      propertyVideos: (json['propertyVideos'] as List<dynamic>).map<MediaModel>((data)=>MediaModel.fromJson(data)).toList(),
    );
  }
  final ListerModel lister_;
  final PaymentInformationModel paymentInformation_;
  final PropertyLocationModel propertyLocation_;
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'listerId': listerId,
      'paymentInformationId': paymentInformationId,
      'propertyLocationId': propertyLocationId,
      'title': title,
      'description': description,
      'propertyType': propertyType.index,
      'propertySubType': propertySubType.index,
      'listingType': listingType.index,
      'publishStatus': propertyPublishStatus.index,
      'marketStatus': propertyMarketStatus.index,
      'propertySize': propertySize,
      'availableStartDate': availableStartDate.toIso8601String(),
      'availableEndDate': availableEndDate.toIso8601String(),
      'lister': lister_.toJson(),
      'paymentInformation': paymentInformation_.toJson(),
      'propertyLocation': propertyLocation_.toJson(),
      'propertyPhotos': propertyPhotos,
      'propertyVideos': propertyVideos,
    };
  }
}
