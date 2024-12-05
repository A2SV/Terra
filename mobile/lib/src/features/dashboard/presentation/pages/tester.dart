// import 'package:flutter/material.dart';
// import 'package:mobile/src/features/dashboard/data/data.dart';
// import 'package:mobile/src/features/dashboard/data/models/enums.dart';
// // import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:mobile/src/features/dashboard/presentation/widgets/listings_card.dart'; // Import ListingsCard

// class TestListingsCardPage extends StatelessWidget {
//   const TestListingsCardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final testListing = ListingModel(
//       id: '123',
//       title: 'Luxury Apartment',
//       description: 'A beautiful 2-bedroom apartment in the heart of the city.',
//       propertyType: PropertyType.apartment,
//       listingType: PropertyListingType.forRent,
//       propertyPublishStatus: PropertyPublishStatus.published,
//       propertyMarketStatus: PropertyMarketStatus.available,
//       propertySize: 1200,
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//       listerId: 'lister_001',
//       paymentInformationId: 'payment_001',
//       propertyLocationId: 'location_001',
//       availableStartDate: DateTime(2024, 12, 1),
//       availableEndDate: DateTime(2025, 1, 1),
//       lister: ListerModel(
//         id: '1',
//         userName: 'john_doe',
//         normalizedUserName: 'JOHN_DOE',
//         email: 'john.doe@example.com',
//         normalizedEmail: 'JOHN.DOE@EXAMPLE.COM',
//         emailConfirmed: true,
//         passwordHash: 'hashedpassword',
//         securityStamp: 'securitystamp',
//         concurrencyStamp: 'concurrencystamp',
//         phoneNumber: '+1234567890',
//         phoneNumberConfirmed: true,
//         twoFactorEnabled: true,
//         lockoutEnd: DateTime.now().add(const Duration(days: 1)),
//         lockoutEnabled: true,
//         accessFailedCount: 0,
//         firstName: 'John',
//         lastName: 'Doe',
//         gender: 'Male',
//         dateOfBirth: DateTime(1990, 1, 1),
//         profilePictureUrl:
//             'https://images.unsplash.com/photo-1502323777036-f29e3972d82f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
//         verificationToken: 'verificationtoken',
//         passwordResetToken: 'passwordresettoken',
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         isVerified: true,
//       ),
//       paymentInformation: PaymentInformationModel(
//         id: '1',
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         currency: 0, // Assuming 0 represents USD
//         paymentFrequency: 0, // Assuming 0 represents Monthly
//         cost: 1000.0,
//         negotiable: true,
//       ),
//       propertyLocation: PropertyLocationModel(
//         id: '1',
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         streetName: 'Main St',
//         houseNumber: '123',
//         city: 'Anytown',
//         country: 'USA',
//         zipCode: '12345',
//         longitude: -122.4194,
//         latitude: 37.7749,
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Test Listings Card'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
//         child: ListingsCard(
//           listing: testListing,
//         ),
//       ),
//     );
//   }
// }
