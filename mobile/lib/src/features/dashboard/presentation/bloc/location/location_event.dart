part of 'location_bloc.dart';

@immutable
sealed class LocationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckLocationPermissionEvent extends LocationEvent {}

class RequestLocationPermissionEvent extends LocationEvent {}
