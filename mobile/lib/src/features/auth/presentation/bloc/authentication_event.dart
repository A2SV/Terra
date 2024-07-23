part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetPasswordEvent extends AuthenticationEvent {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final String token;

  ResetPasswordEvent(
      {required this.email,
      required this.newPassword,
      required this.confirmPassword,
      required this.token});
   @override
  List<Object> get props => [email,newPassword,confirmPassword,token];
}
