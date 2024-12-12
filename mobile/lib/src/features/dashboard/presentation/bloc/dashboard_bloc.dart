import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:mobile/src/features/dashboard/domain/use_cases/use_cases.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetListingsUseCase getListingsUseCase;
  final CheckLocationPermissionUseCase checkLocationPermissionUseCase;
  final RequestLocationPermissionUseCase requestLocationPermissionUseCase;

  DashboardBloc({
    required this.getListingsUseCase,
    required this.checkLocationPermissionUseCase,
    required this.requestLocationPermissionUseCase,
  }) : super(DashboardInitial()) {
    on<GetAllListingsEvent>(getAllListingsEvent);
    on<CheckLocationPermissionEvent>(checkLocationPermissionEvent); 
    on<RequestLocationPermissionEvent>(requestLocationPermissionEvent);
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

