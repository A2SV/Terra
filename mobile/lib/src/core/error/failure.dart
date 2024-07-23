import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class APIFailure extends Failure{
  const APIFailure(super.message);
}
class NetworkFailure extends Failure{
  const NetworkFailure(super.message);
}

class ServerFailure extends Failure{
  ServerFailure(super.message);
}


class LoginFailure extends Failure{
  LoginFailure(super.message);
}