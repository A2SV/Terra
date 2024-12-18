part of 'location_bloc.dart';

@immutable
sealed class LocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
  @override
  List<Object?> get props => [message];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

class LocationPermissionState extends LocationState {
  final bool isGranted;

  LocationPermissionState({required this.isGranted});

  @override
  List<Object?> get props => [isGranted];
}

class LocationErrorState extends LocationState {
  final String errorMessage;

  LocationErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class LocationPromptState extends LocationState {
  // for showing the modal
  @override
  List<Object?> get props => [];
}
