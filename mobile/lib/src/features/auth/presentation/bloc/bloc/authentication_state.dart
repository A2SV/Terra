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



class Empty extends AuthenticationState{}

class Initial extends AuthenticationState{
  Loading(){
    print('loading...');
  }
}

class LoggingIn extends AuthenticationState{
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

class LoggedIn extends AuthenticationState{
  final String message;

  LoggedIn({this.message='logged in'});

  @override
  List<Object> get props=>[message];

}

class LoginSuccess extends AuthenticationState{
  final String message;
  final UserAccount user;

  LoginSuccess({this.message='login success!!',required this.user});

  @override
  List<Object> get props=>[message];
}

class LoginFailed extends AuthenticationState{
  final String message;

  LoginFailed({this.message='login failed!!'});

  @override
  List<Object> get props=>[message];
}

class Error extends AuthenticationState{
  final String message;

  Error({required this.message});

  @override
  List<Object> get props=>[message];
}