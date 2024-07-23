import 'package:equatable/equatable.dart';
import 'package:mobile/src/core/entities/user_account.dart';

class Empty extends LoginState {}

class Error extends LoginState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Initial extends LoginState {
  Loading() {
    print('loading...');
  }
}

class LoggedIn extends LoginState {
  final String message;

  LoggedIn({this.message = 'logged in'});

  @override
  List<Object> get props => [message];
}

class LoggingIn extends LoginState {
  final String username;
  final String password;

  LoggingIn({required this.username, required this.password});
  @override
  List<Object> get props => [username, password];
}

class LoginFailed extends LoginState {
  final String message;

  LoginFailed({this.message = 'login failed!!'});

  @override
  List<Object> get props => [message];
}

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final String message;
  final UserAccount user;

  LoginSuccess({this.message = 'login success!!', required this.user});

  @override
  List<Object> get props => [message];
}
