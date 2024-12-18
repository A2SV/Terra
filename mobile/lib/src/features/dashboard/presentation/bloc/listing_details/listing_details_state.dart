part of 'listing_details_bloc.dart';


@immutable
sealed class ListingDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ListingDetailsError extends ListingDetailsState {
  final String message;
  ListingDetailsError(this.message);
  @override
  List<Object?> get props => [message];
}

class ListingDetailsInitial extends ListingDetailsState {}

class ListingDetailsLoading extends ListingDetailsState {}



class ListingDetailSuccess extends ListingDetailsState {
  final ListingDetailModel listingDetail;
  ListingDetailSuccess({required this.listingDetail});
}
