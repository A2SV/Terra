part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllListingEvent extends DashboardEvent {
  final String id;
  GetAllListingEvent({required this.id});
}

class GetAllListingsEvent extends DashboardEvent {}
