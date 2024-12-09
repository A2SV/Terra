import 'package:equatable/equatable.dart';

class APIFailure extends Failure {
  const APIFailure(super.message);
}

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class LoginFailure extends Failure {
  const LoginFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class OTPFailure extends Failure {
  const OTPFailure(super.message);
}

class ResendOTPFailure extends Failure {
  const ResendOTPFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
