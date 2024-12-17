part of 'dashboard_bloc.dart';

final class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
  @override
  List<Object?> get props => [message];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class ListingLoading extends DashboardState {}

@immutable
sealed class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardSuccess extends DashboardState {
  final List<ListingModel> listings;
  DashboardSuccess({required this.listings}) : super();
}

class ListingDetailSuccess extends DashboardSuccess {
  final ListingDetailModel listingDetail;
  ListingDetailSuccess({required this.listingDetail}):super(listings: []);
}

class CompareListing extends DashboardState {
  final ListingModel listing1;
  final ListingModel listing2;
  CompareListing({required this.listing1, required this.listing2});
}

final class ListingError extends DashboardState {
  final String message;
  ListingError(this.message);
  @override
  List<Object?> get props => [message];
}


class LocationPermissionState extends DashboardState {
  final bool isGranted;

  LocationPermissionState({required this.isGranted});

  @override
  List<Object?> get props => [isGranted];
}

// class UserLocationState extends DashboardState { //name this current location
//   final double latitude;
//   final double longitude;

//   UserLocationState({required this.latitude, required this.longitude});

//   @override
//   List<Object?> get props => [latitude, longitude];
// }

class LocationErrorState extends DashboardState {
  final String errorMessage;

  LocationErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}


class LocationPromptState extends DashboardState { // for showing the modal
  @override
  List<Object?> get props => [];
}
