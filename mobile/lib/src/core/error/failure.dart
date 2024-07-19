import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final List properties;
  Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure{
  final String errormessage;
  ServerFailure({this.errormessage='Server Failure'});
}

class NetworkFailure extends Failure{
  final String errormessage;
  NetworkFailure({this.errormessage='Network Failure'});
}

class LoginFailure extends Failure{
  final String errormessage;
  LoginFailure({this.errormessage='User Login Failed'});
}