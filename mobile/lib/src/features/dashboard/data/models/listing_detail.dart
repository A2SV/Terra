import 'package:mobile/src/features/dashboard/data/data.dart';
import 'package:mobile/src/features/dashboard/data/models/amenity.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class ListingDetailModel extends ListingDetailEntity {
  final ListerModel lister_;

  final PaymentInformationModel paymentInformation_;
  final PropertyLocationModel propertyLocation_;
  @override
  final List<AmenityModel>? propertyAmenities;
  @override
  final CommercialPropertyModel? commercialProperty;
  @override
  final ResidentialPropertyModel? residentialProperty;

  const ListingDetailModel({
    required super.id,
    required super.listerId,
    required super.paymentInformationId,
    required super.propertyLocationId,
    required super.title,
    required super.description,
    required super.propertyType,
    required super.propertySubType,
    required super.listingType,
    required super.propertySize,
    required super.availableStartDate,
    required super.availableEndDate,
    required super.propertyPhotos,
    required super.propertyVideos,
    required this.paymentInformation_,
    required this.propertyLocation_,
    required this.lister_,
    required this.propertyAmenities,
    required this.commercialProperty,
    required this.residentialProperty,
  }) : super(
            lister: lister_,
            paymentInformation: paymentInformation_,
            propertyLocation: propertyLocation_);
  factory ListingDetailModel.fromJson(Map<String, dynamic> json) {
    return ListingDetailModel(
      id: json['id'],
      listerId: json['listerId'],
      paymentInformationId: json['paymentInformationId'],
      propertyLocationId: json['propertyLocationId'],
      title: json['title'],
      description: json['description'],
      propertyType: PropertyType.values
          .firstWhere((type) => type.name == json['propertyType']),
      propertySubType: PropertySubType.values
          .firstWhere((type) => type.name == json['propertySubType']),
      listingType: PropertyListingType.values
          .firstWhere((type) => type.name == json['listingType']),
      propertySize: json['propertySize']?.toDouble(),
      availableStartDate: json['availableStartDate'] != null
          ? DateTime.parse(json['availableStartDate'])
          : null,
      availableEndDate: json['availableEndDate'] != null
          ? DateTime.parse(json['availableEndDate'])
          : null,
      lister_: ListerModel.fromJson(json['lister']),
      paymentInformation_:
          PaymentInformationModel.fromJson(json['paymentInformation']),
      propertyLocation_:
          PropertyLocationModel.fromJson(json['propertyLocation']),
      propertyPhotos: json['propertyPhotos'] != null
          ? (json['propertyPhotos'] as List)
              .map((e) => MediaModel.fromJson(e))
              .toList()
          : null,
      propertyVideos: json['propertyVideos'] != null
          ? (json['propertyVideos'] as List)
              .map((e) => MediaModel.fromJson(e))
              .toList()
          : null,
      propertyAmenities: json['propertyAmenities'] != null
          ? (json['propertyAmenities'] as List)
              .map((e) => AmenityModel.fromJson(e))
              .toList()
          : null,
      commercialProperty: json['commercialProperty'] != null
          ? CommercialPropertyModel.fromJson(json['commercialProperty'])
          : null,
      residentialProperty: json['residentialProperty'] != null
          ? ResidentialPropertyModel.fromJson(json['residentialProperty'])
          : null,
    );
  }
  ListingDetailModel copyWith({
    String? id,
    String? listerId,
    String? paymentInformationId,
    String? propertyLocationId,
    String? title,
    String? description,
    PropertyType? propertyType,
    PropertySubType? propertySubType,
    PropertyPublishStatus? publishStatus,
    PropertyMarketStatus? marketStatus,
    PropertyListingType? listingType,
    double? propertySize,
    DateTime? availableStartDate,
    DateTime? availableEndDate,
    ListerModel? lister_,
    PaymentInformationModel? paymentInformation_,
    PropertyLocationModel? propertyLocation_,
    List<MediaModel>? propertyPhotos,
    List<MediaModel>? propertyVideos,
    List<AmenityModel>? propertyAmenities,
    CommercialPropertyModel? commercialProperty,
    ResidentialPropertyModel? residentialProperty,
  }) {
    return ListingDetailModel(
      id: id ?? this.id,
      listerId: listerId ?? this.listerId,
      paymentInformationId: paymentInformationId ?? this.paymentInformationId,
      propertyLocationId: propertyLocationId ?? this.propertyLocationId,
      title: title ?? this.title,
      description: description ?? this.description,
      propertyType: propertyType ?? this.propertyType,
      propertySubType: propertySubType ?? this.propertySubType,
      listingType: listingType ?? this.listingType,
      propertySize: propertySize ?? this.propertySize,
      availableStartDate: availableStartDate ?? this.availableStartDate,
      availableEndDate: availableEndDate ?? this.availableEndDate,
      lister_: lister_ ?? this.lister_,
      paymentInformation_: paymentInformation_ ?? this.paymentInformation_,
      propertyLocation_: propertyLocation_ ?? this.propertyLocation_,
      propertyPhotos: propertyPhotos ?? this.propertyPhotos,
      propertyVideos: propertyVideos ?? this.propertyVideos,
      propertyAmenities: propertyAmenities ?? this.propertyAmenities,
      commercialProperty: commercialProperty ?? this.commercialProperty,
      residentialProperty: residentialProperty ?? this.residentialProperty,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'listerId': listerId,
      'paymentInformationId': paymentInformationId,
      'propertyLocationId': propertyLocationId,
      'title': title,
      'description': description,
      'propertyType': propertyType.name,
      'propertySubType': propertySubType.name,
      'publishStatus': publishStatus.name,
      'marketStatus': marketStatus.name,
      'listingType': listingType.name,
      'propertySize': propertySize,
      'availableStartDate': availableStartDate?.toIso8601String(),
      'availableEndDate': availableEndDate?.toIso8601String(),
      'lister': lister_.toJson(),
      'paymentInformation': paymentInformation_.toJson(),
      'propertyLocation': propertyLocation_.toJson(),
      'propertyPhotos': propertyPhotos,
      'propertyVideos': propertyVideos,
      'propertyAmenities': propertyAmenities?.map((e) => e.toJson()).toList(),
      'commercialProperty': commercialProperty?.toJson(),
      'residentialProperty': residentialProperty?.toJson(),
    };
  }
}
