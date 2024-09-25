part of 'dashboard_bloc.dart';

final class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
  @override
  List<Object?> get props => [message];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}
class DashboardILoading extends DashboardState {}

@immutable
sealed class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardSuccess extends DashboardState {
  final List<ListingModel> listings;
  DashboardSuccess({required this.listings}) : super();
}
class GetListingSuccess extends DashboardSuccess {
  final ListingModel listing;
  GetListingSuccess({required this.listing}) : super(listings: [listing]);
}
