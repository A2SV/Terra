import 'package:equatable/equatable.dart';
import 'package:mobile/src/core/entities/user_account.dart';

import '../../../domain/domain.dart';

abstract class LoginState extends Equatable{
  @override
  List<Object> get props=>[];
}

class Empty extends LoginState{}

class Initial extends LoginState{
  Loading(){
    print('loading...');
  }
}

class LoggingIn extends LoginState{
  final String username;
  final String password;

  LoggingIn({
    required this.username,
    required this.password
  }){

  }
  @override
  List<Object> get props=>[username,password];
}

class LoggedIn extends LoginState{
  final String message;

  LoggedIn({this.message='logged in'});

  @override
  List<Object> get props=>[message];

}

class LoginSuccess extends LoginState{
  final String message;
  final UserAccount user;

  LoginSuccess({this.message='login success!!',required this.user});

  @override
  List<Object> get props=>[message];
}

class LoginFailed extends LoginState{
  final String message;

  LoginFailed({this.message='login failed!!'});

  @override
  List<Object> get props=>[message];
}

class Error extends LoginState{
  final String message;

  Error({required this.message});

  @override
  List<Object> get props=>[message];
}