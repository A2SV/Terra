part of 'listing_details_bloc.dart';

@immutable
sealed class ListingDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadListingDetailsEvent extends ListingDetailsEvent {
  final String id;

  LoadListingDetailsEvent({required this.id});
}
