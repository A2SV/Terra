import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/payment_info_create_model.dart';
import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/property_location_create_model.dart';
import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/property_photo_create_model.dart';
import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/property_video_create_model.dart';

class CreateListingRequestModel {
  final String title;
  final String description;
  final int propertyType;
  final int propertySubType;
  final int listingType;
  final int propertySize;
  final DateTime availableStartDate;
  final DateTime availableEndDate;
  final PaymentInformationCreateModel paymentInformation;
  final PropertyLocationCreateModel propertyLocation;
  final List<PropertyPhotoCreateModel> propertyPhotos;
  final List<PropertyVideoCreateModel> propertyVideos;

  CreateListingRequestModel({
    required this.title,
    required this.description,
    required this.propertyType,
    required this.propertySubType,
    required this.listingType,
    required this.propertySize,
    required this.availableStartDate,
    required this.availableEndDate,
    required this.paymentInformation,
    required this.propertyLocation,
    required this.propertyPhotos,
    required this.propertyVideos,
  });

  CreateListingRequestModel copyWith({
    String? title,
    String? description,
    int? propertyType,
    int? propertySubType,
    int? listingType,
    int? propertySize,
    DateTime? availableStartDate,
    DateTime? availableEndDate,
    PaymentInformationCreateModel? paymentInformation,
    PropertyLocationCreateModel? propertyLocation,
    List<PropertyPhotoCreateModel>? propertyPhotos,
    List<PropertyVideoCreateModel>? propertyVideos,
  }) {
    return CreateListingRequestModel(
      title: title ?? this.title,
      description: description ?? this.description,
      propertyType: propertyType ?? this.propertyType,
      propertySubType: propertySubType ?? this.propertySubType,
      listingType: listingType ?? this.listingType,
      propertySize: propertySize ?? this.propertySize,
      availableStartDate: availableStartDate ?? this.availableStartDate,
      availableEndDate: availableEndDate ?? this.availableEndDate,
      paymentInformation: paymentInformation ?? this.paymentInformation,
      propertyLocation: propertyLocation ?? this.propertyLocation,
      propertyPhotos: propertyPhotos ?? this.propertyPhotos,
      propertyVideos: propertyVideos ?? this.propertyVideos,
    );
  }
}