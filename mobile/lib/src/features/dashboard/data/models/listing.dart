import 'dart:math';

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
      createdAt: DateTime.parse(json['createdAt']??'2024-09-01T00:00:00Z'),
      updatedAt: DateTime.parse(json['updatedAt']??'2024-09-01T00:00:00Z'),
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
      lister: //ListerModel.fromJson(json['lister']) ??
          ListerModel(
        id: '1',
        userName: 'john_doe',
        normalizedUserName: 'JOHN_DOE',
        email: 'john.doe@example.com',
        normalizedEmail: 'JOHN.DOE@EXAMPLE.COM',
        emailConfirmed: true,
        passwordHash: 'hashedpassword',
        securityStamp: 'securitystamp',
        concurrencyStamp: 'concurrencystamp',
        phoneNumber: '+1234567890',
        phoneNumberConfirmed: true,
        twoFactorEnabled: true,
        lockoutEnd: DateTime.now().add(const Duration(days: 1)),
        lockoutEnabled: true,
        accessFailedCount: 0,
        firstName: 'John',
        lastName: 'Doe',
        gender: 'Male',
        dateOfBirth: DateTime(1990, 1, 1),
        profilePictureUrl:
            'https://images.unsplash.com/photo-1502323777036-f29e3972d82f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
        verificationToken: 'verificationtoken',
        passwordResetToken: 'passwordresettoken',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isVerified: true,
      ),
      paymentInformation:
          // PaymentInformationModel.fromJson(json['paymentInformation']),
          PaymentInformationModel(
        id: '1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        currency: 0, // Assuming 0 represents a specific currency, e.g., USD
        paymentFrequency:
            0, // Assuming 0 represents a specific frequency, e.g., Monthly
        cost: Random().nextInt(10000) * 1.0,
        negotiable: true,
      ),
      propertyLocation:
          // PropertyLocationModel.fromJson(json['propertyLocation']),
          PropertyLocationModel(
        id: '1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        streetName: 'Main St',
        houseNumber: '123',
        city: 'Anytown',
        country: 'USA',
        zipCode: '12345',
        longitude: -122.4194,
        latitude: 37.7749,
      ),
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
