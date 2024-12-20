part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
  @override
  List<Object?> get props => [message];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class ListingLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final List<ListingModel> listings;
  DashboardSuccess({required this.listings}) : super();
}

final class ListingError extends DashboardState {
  final String message;
  ListingError(this.message);
  @override
  List<Object?> get props => [message];
}
