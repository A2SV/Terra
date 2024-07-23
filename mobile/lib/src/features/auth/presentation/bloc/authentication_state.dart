part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {}

final class AuthenticationError extends AuthenticationState {
  final String message;

  AuthenticationError({required this.message});
}

final class AuthenticationLoading extends AuthenticationState {}

final class ResetPasswordSuccess extends AuthenticationSuccess{}

final class ResetPasswordError extends AuthenticationError{
  ResetPasswordError({required super.message});
}
