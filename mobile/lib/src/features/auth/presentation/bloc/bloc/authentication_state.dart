part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState{}

final class AuthenticationError extends AuthenticationState{
  final String message;
  AuthenticationError(this.message);
  @override
  List<Object?> get props => [message];
}


final class AuthenticationSuccess extends AuthenticationState{}


final class RegisterUserSuccess extends AuthenticationSuccess{
  final String email;
  RegisterUserSuccess(this.email);
}