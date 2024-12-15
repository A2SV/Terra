part of 'app_user_cubit.dart';

@immutable
sealed class AppUserCubitState {}

/// Initial state when no action has been performed
final class AppUserInitial extends AppUserCubitState {}

/// State when a user is loaded successfully
final class AppUserLoggedIn extends AppUserCubitState {
  final UserAccount user;

  AppUserLoggedIn({required this.user});
}

/// State for any error that occurs
final class AppUserError extends AppUserCubitState {
  final String message;

  AppUserError({required this.message});
}
