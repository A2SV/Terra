part of 'conpare_listings_bloc.dart';

@immutable
sealed class CompareListingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CompareListings extends CompareListingsEvent {
  final String id1;
  final String id2;
  CompareListings({required this.id1, required this.id2});
}
