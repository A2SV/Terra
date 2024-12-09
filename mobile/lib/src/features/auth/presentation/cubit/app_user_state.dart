part of 'app_user_cubit.dart';

@immutable
sealed class AppUserCubitState {}

/// Initial state when no action has been performed
final class AppUserCubitInitial extends AppUserCubitState {}

/// State when a user is loaded successfully
final class AppUserLoaded extends AppUserCubitState {
  final UserModel user;

  AppUserLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

/// State when no user is logged in
final class AppUserNotLoggedIn extends AppUserCubitState {}

/// State for any error that occurs
final class AppUserError extends AppUserCubitState {
  final String message;

  AppUserError({required this.message});

  @override
  List<Object?> get props => [message];
}
