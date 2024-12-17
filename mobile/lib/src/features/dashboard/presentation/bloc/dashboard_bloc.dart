import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/dashboard/data/data.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetListingsUseCase getListingsUseCase;
  final GetListingUseCase getListingUseCase;
  final GetListingByIdUseCase getListingByIdUseCase;
    final CheckLocationPermissionUseCase checkLocationPermissionUseCase;
  final RequestLocationPermissionUseCase requestLocationPermissionUseCase;
  DashboardBloc({
    required this.getListingsUseCase,
    required this.getListingUseCase,
    required this.getListingByIdUseCase,
      required this.checkLocationPermissionUseCase,
    required this.requestLocationPermissionUseCase,
  }) : super(DashboardInitial()) {
    on<GetAllListingsEvent>(getAllListingsEvent);
    on<GetListingEvent>(getListingEvent);
    on<CompareListingsEvent>(compareListingsEvent);
    on<LoadDashBoardEvent>(loadDashBoardEvent);
    on<GetListingByIdEvent>(_getListingById);
    on<CheckLocationPermissionEvent>(checkLocationPermissionEvent); 
    on<RequestLocationPermissionEvent>(requestLocationPermissionEvent);
  }

  FutureOr<void> loadDashBoardEvent(
      DashboardEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardInitial());
  }

  FutureOr<void> getAllListingsEvent(
      DashboardEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    final result = await getListingsUseCase(NoParams());
    result.fold(
      (failure) => emit(DashboardError(failure.message)),
      (listings) => emit(DashboardSuccess(listings: listings)),
    );
  }

  FutureOr<void> getListingEvent(
      GetListingEvent event, Emitter<DashboardState> emit) async {
    emit(ListingLoading());
    final result = await getListingUseCase(ListingParams(id: event.id));
    print(result);
    result.fold(
        (failure) => emit(ListingError(failure.message)), (listing) => listing);
  }

  FutureOr<void> compareListingsEvent(
      CompareListingsEvent event, Emitter<DashboardState> emit) async {
    late ListingModel listing1;
    late ListingModel listing2;
    emit(ListingLoading());
    print('Events...');
    print(event.id1);
    print(event.id2);

    final result2 = await getListingUseCase(ListingParams(id: event.id2));
    print(result2);
    result2.fold((failure) => emit(ListingError(failure.message)),
        (listing_2) => listing2 = listing_2);
    final result1 = await getListingUseCase(ListingParams(id: event.id1));
    result1.fold((failure) => emit(ListingError(failure.message)),
        (listing_1) => listing1 = listing_1);
    if (listing1 != Null && listing2 != Null) {
      emit(CompareListing(listing1: listing1, listing2: listing2));
    }

  }
  FutureOr<void> _getListingById(GetListingByIdEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    final result = await getListingByIdUseCase(ListingParams(id: event.id));
    result.fold(
      (failure) => emit(DashboardError(failure.message)),
      (listing) => emit(ListingDetailSuccess(listingDetail: listing)),
    );
  }
}

  FutureOr<void> checkLocationPermissionEvent(
      CheckLocationPermissionEvent event, Emitter<DashboardState> emit) async {
    try {
      final isGranted = await checkLocationPermissionUseCase();
      if (isGranted) {
        emit(LocationPermissionState(isGranted: true));
      } else {
        emit(LocationPermissionState(isGranted: false));
      }
    } catch (error) {
      emit(DashboardError(error.toString()));
    }
  }

  FutureOr<void> requestLocationPermissionEvent(
      RequestLocationPermissionEvent event, Emitter<DashboardState> emit) async {
    try {
      final isGranted = await requestLocationPermissionUseCase();
      if (isGranted) {
        emit(LocationPermissionState(isGranted: true));
      } else {
        emit(LocationPermissionState(isGranted: false));
      }
    } catch (error) {
      emit(DashboardError(error.toString()));
    }
  }
}