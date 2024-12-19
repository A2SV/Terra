import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/create_listing_request_model.dart';
import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/payment_info_create_model.dart';
import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/property_location_create_model.dart';
import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/property_photo_create_model.dart';
import 'package:mobile/src/features/dashboard/data/models/create_lisiting_model/property_video_create_model.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/add_listings/add_listing_status.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/add_listings/add_listings_state.dart';

class AddListingsCubit extends Cubit<AddListingsState> {
  AddListingsCubit()
      : super(
          AddListingsState(
            request: CreateListingRequestModel(
              title: '',
              description: '',
              propertyType: 0,
              propertySubType: 0,
              listingType: 1,
              propertySize: 0,
              availableStartDate: DateTime.now(),
              availableEndDate: DateTime.now().add(const Duration(days: 30)),
              paymentInformation: const PaymentInformationCreateModel(
                currency: 0,
                paymentFrequency: 2,
                cost: 0.0,
                negotiable: true,
              ),
              propertyLocation: const PropertyLocationCreateModel(
                streetName: '',
                houseNumber: '',
                city: '',
                country: '',
                zipCode: '',
                longitude: 0.0,
                latitude: 0.0,
              ),
              propertyPhotos: const <PropertyPhotoCreateModel>[],
              propertyVideos: const <PropertyVideoCreateModel>[],
            ),
            status: AddListingsStatus.initial,
          ),
        );

  void updateTitle(String title) {
    emit(state.copyWith(request: state.request.copyWith(title: title)));
  }

  void updateDescription(String description) {
    emit(state.copyWith(
        request: state.request.copyWith(description: description)));
  }

  void updateCategory(int category) {
    emit(
        state.copyWith(request: state.request.copyWith(listingType: category)));
  }

  void updatePropertyType(int propertyType) {
    emit(state.copyWith(
        request: state.request.copyWith(propertyType: propertyType)));
  }

  void updatePropertySubType(int propertySubType) {
    emit(state.copyWith(
        request: state.request.copyWith(propertySubType: propertySubType)));
  }

  void updateCurrency(int currency) {
    final paymentInfo =
        state.request.paymentInformation.copyWith(currency: currency);
    emit(state.copyWith(
        request: state.request.copyWith(paymentInformation: paymentInfo)));
  }

  void updateCost(double cost) {
    final paymentInfo = state.request.paymentInformation.copyWith(cost: cost);
    emit(state.copyWith(
        request: state.request.copyWith(paymentInformation: paymentInfo)));
  }

  void updatePaymentFrequency(int frequency) {
    final paymentInfo =
        state.request.paymentInformation.copyWith(paymentFrequency: frequency);
    emit(state.copyWith(
        request: state.request.copyWith(paymentInformation: paymentInfo)));
  }

  void updateAvailableDates(DateTime start, DateTime end) {
    emit(state.copyWith(
      request: state.request.copyWith(
        availableStartDate: start,
        availableEndDate: end,
      ),
    ));
  }

  void updatePropertyLocation({
    required String streetName,
    required String houseNumber,
    required String city,
    required String country,
    required String zipCode,
    required double longitude,
    required double latitude,
  }) {
    final updatedLocation = state.request.propertyLocation.copyWith(
      streetName: streetName,
      houseNumber: houseNumber,
      city: city,
      country: country,
      zipCode: zipCode,
      longitude: longitude,
      latitude: latitude,
    );
    emit(state.copyWith(
        request: state.request.copyWith(propertyLocation: updatedLocation)));
  }

  void addPhoto(String url) {
    final updatedPhotos = <PropertyPhotoCreateModel>[
      ...state.request.propertyPhotos,
      PropertyPhotoCreateModel(url: url)
    ];
    emit(state.copyWith(
        request: state.request.copyWith(propertyPhotos: updatedPhotos)));
  }

  void removePhoto(String url) {
    final updatedPhotos = (state.request.propertyPhotos)
        .where((p) => p.url != url)
        .toList();
    emit(state.copyWith(
        request: state.request.copyWith(propertyPhotos: updatedPhotos)));
  }

  void addVideo(String url) {
    final updatedVideos = <PropertyVideoCreateModel>[
      ...state.request.propertyVideos,
      PropertyVideoCreateModel(url: url)
    ];
    emit(state.copyWith(
        request: state.request.copyWith(propertyVideos: updatedVideos)));
  }

  void removeVideo(String url) {
    final updatedVideos = (state.request.propertyVideos)
        .where((v) => v.url != url)
        .toList();
    emit(state.copyWith(
        request: state.request.copyWith(propertyVideos: updatedVideos)));
  }

  Future<void> submitListing() async {
    emit(state.copyWith(status: AddListingsStatus.submitting));
    try {
      emit(state.copyWith(status: AddListingsStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: AddListingsStatus.failure, errorMessage: e.toString()));
    }
  }
}
