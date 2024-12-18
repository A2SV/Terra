import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/features/dashboard/data/data.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

part 'listimg_details_event.dart';
part 'listing_details_state.dart';

class ListingDetailBloc extends Bloc<ListingDetailsEvent, ListingDetailsState> {
  final GetListingByIdUseCase getListingByIdUseCase;
  ListingDetailBloc({
    required this.getListingByIdUseCase,
  }) : super(ListingDetailsInitial()) {
    on<LoadListingDetailsEvent>(_getListingById);
  }

  FutureOr<void> _getListingById(
      LoadListingDetailsEvent event, Emitter<ListingDetailsState> emit) async {
    emit(ListingDetailsLoading());
    final result = await getListingByIdUseCase(ListingParams(id: event.id));
    result.fold(
      (failure) => emit(ListingDetailsError(failure.message)),
      (listing) => emit(ListingDetailSuccess(listingDetail: listing)),
    );
  }
}
