part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationRegisterUserEvent extends AuthenticationEvent {
  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;
  AuthenticationRegisterUserEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });
}

class LoginUserEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class ForgotPasswordEvent extends AuthenticationEvent {
  final String email;

  ForgotPasswordEvent({
    required this.email,
  });
}

class VerifyOTPEvent extends AuthenticationEvent {
  final String email;
  final String code;

  VerifyOTPEvent({
    required this.email,
    required this.code,
  });
}

class ResendOTPEvent extends AuthenticationEvent {
  final String email;

  ResendOTPEvent({
    required this.email,
  });
}

class GetCachedUserEvent extends AuthenticationEvent {}
