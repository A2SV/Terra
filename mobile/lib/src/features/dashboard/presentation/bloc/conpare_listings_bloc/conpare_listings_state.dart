part of 'conpare_listings_bloc.dart';

@immutable
sealed class CompareListingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CompareListingsInitial extends CompareListingsState {}

class CompareListingsLoading extends CompareListingsState {}

class CompareListingsSuccess extends CompareListingsState {
  final ListingModel listing1;
  final ListingModel listing2;
  CompareListingsSuccess({required this.listing1, required this.listing2});
}

final class CompareListingsError extends CompareListingsState {
  final String message;
  CompareListingsError(this.message);
  @override
  List<Object?> get props => [message];
}
