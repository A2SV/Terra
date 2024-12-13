
part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllListingsEvent extends DashboardEvent {}

class LoadDashBoardEvent extends DashboardEvent {}

class GetListingEvent extends DashboardEvent{
  final String id;
  GetListingEvent({required this.id});
}


class CompareListingsEvent extends DashboardEvent{
  final String id1;
  final String id2;
  CompareListingsEvent({required this.id1,required this.id2});
}