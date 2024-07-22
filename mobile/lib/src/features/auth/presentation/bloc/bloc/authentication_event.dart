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


class LoginUserEvent extends AuthenticationEvent{
  final String username;
  final String password;

  LoginUserEvent({
    required this.username,
    required this.password
  });

  @override
  List<Object> get props=>[username,password];
}
