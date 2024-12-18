import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final CheckLocationPermissionUseCase checkLocationPermissionUseCase;
  final RequestLocationPermissionUseCase requestLocationPermissionUseCase;
  LocationBloc({
    required this.checkLocationPermissionUseCase,
    required this.requestLocationPermissionUseCase,
  }) : super(LocationInitial()) {
    on<CheckLocationPermissionEvent>(checkLocationPermissionEvent);
    on<RequestLocationPermissionEvent>(requestLocationPermissionEvent);
  }

  FutureOr<void> checkLocationPermissionEvent(
      CheckLocationPermissionEvent event, Emitter<LocationState> emit) async {
    try {
      final isGranted = await checkLocationPermissionUseCase();
      if (isGranted) {
        emit(LocationPermissionState(isGranted: true));
      } else {
        emit(LocationPermissionState(isGranted: false));
      }
    } catch (error) {
      emit(LocationError(error.toString()));
    }
  }

  FutureOr<void> requestLocationPermissionEvent(
      RequestLocationPermissionEvent event, Emitter<LocationState> emit) async {
    try {
      final isGranted = await requestLocationPermissionUseCase();
      if (isGranted) {
        emit(LocationPermissionState(isGranted: true));
      } else {
        emit(LocationPermissionState(isGranted: false));
      }
    } catch (error) {
      emit(LocationError(error.toString()));
    }
  }
}
