part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationError extends AuthenticationState {
  final String message;
  AuthenticationError({required this.message});
  @override
  List<Object?> get props => [message];
}

final class AuthenticationSuccess extends AuthenticationState {}

final class RegisterUserSuccess extends AuthenticationSuccess {
  final String email;
  RegisterUserSuccess(this.email);

  @override
  List<Object?> get props => [email];
}

final class ForgotPasswordSuccess extends AuthenticationState {}

final class ResendMailSuccess extends AuthenticationState {}

class LoggingIn extends AuthenticationState {
  final String username;
  final String password;

  LoggingIn({required this.username, required this.password});
  @override
  List<Object> get props => [username, password];
}

class LoginSuccess extends AuthenticationState {
  final String message;
  final UserAccount user;

  LoginSuccess({this.message = 'login success!!', required this.user});

  @override
  List<Object> get props => [message];
}

class LoginFailed extends AuthenticationState {
  final String message;

  LoginFailed({this.message = 'login failed!!'});

  @override
  List<Object> get props => [message];
}

final class VerifyOTPSuccess extends AuthenticationState {}

final class VerifyOTPFailure extends AuthenticationState {
  final String message;
  VerifyOTPFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

final class GetCachedUserSuccess extends AuthenticationState {
  final UserAccount user;
  GetCachedUserSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

final class GetCacheUserFailure extends AuthenticationState {
  final String message;
  GetCacheUserFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
