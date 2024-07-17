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
class PasswordFailure extends Failure{
  const PasswordFailure(super.message);
}