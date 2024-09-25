import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/dashboard/data/models/listing.dart';
import 'package:mobile/src/features/dashboard/domain/use_cases/get_listing_use_case.dart';
import 'package:mobile/src/features/dashboard/domain/use_cases/use_cases.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetListingsUseCase getListingsUseCase;
  final GetListingUseCase getListingUseCase;
  DashboardBloc({
    required this.getListingsUseCase,
    required this.getListingUseCase,

  }) : super(DashboardInitial()) {
    on<GetAllListingsEvent>(getAllListingsEvent);
    on<GetAllListingEvent>(getAllListingEvent);
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
  FutureOr<void> getAllListingEvent(
      GetAllListingEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardILoading());
    final result = await getListingUseCase(GetListingParams(id: event.id));
    result.fold(
      (failure) => emit(DashboardError(failure.message)),
      (listing) => emit(GetListingSuccess(listing: listing)),
    );
  }
}
