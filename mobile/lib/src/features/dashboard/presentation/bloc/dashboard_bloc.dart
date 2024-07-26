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
  DashboardBloc({
    required this.getListingsUseCase,
  }) : super(DashboardInitial()) {
    on<GetAllListingsEvent>(getAllListingsEvent);
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
}
