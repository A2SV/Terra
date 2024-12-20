import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/features/dashboard/data/data.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

part 'conpare_listings_event.dart';
part 'conpare_listings_state.dart';

class CompareListingsBloc
    extends Bloc<CompareListingsEvent, CompareListingsState> {
  final GetListingUseCase getListingUseCase;
  CompareListingsBloc({
    required this.getListingUseCase,
  }) : super(CompareListingsInitial()) {
    on<CompareListings>(compareListingsEvent);
  }

  FutureOr<void> compareListingsEvent(
      CompareListings event, Emitter<CompareListingsState> emit) async {
    late ListingModel listing1;
    late ListingModel listing2;
    emit(CompareListingsLoading());

    final result2 = await getListingUseCase(ListingParams(id: event.id2));
    result2.fold((failure) => emit(CompareListingsError(failure.message)),
        (listing_2) => listing2 = listing_2);
    final result1 = await getListingUseCase(ListingParams(id: event.id1));
    result1.fold((failure) => emit(CompareListingsError(failure.message)),
        (listing_1) => listing1 = listing_1);
    if (listing1 != Null && listing2 != Null) {
      emit(CompareListingsSuccess(listing1: listing1, listing2: listing2));
    }
  }
}

// Cubit to manage a list of strings (selected listings)
class SelectedListsingsCubit extends Cubit<List<String>> {
  SelectedListsingsCubit() : super([]);

  //  Method to add an item from the list
  void addListing(String id) {
    final updatedList = List<String>.from(state);

    if (updatedList.length >= 2) {
      updatedList.removeAt(0);
    }

    updatedList.add(id);
    emit(updatedList);
  }

  // Method to remove an item from the list
  void removeListing(String id) {
    final updatedList = List<String>.from(state)..remove(id);
    emit(updatedList);
  }

  void clearAll() {
    emit([]);
  }
}
