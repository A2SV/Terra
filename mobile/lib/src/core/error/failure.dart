import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  Failure({required this.message});
  @override
  List<Object> get props => [];
  
}

class ResetPasswordFailure extends Failure {
  ResetPasswordFailure({required super.message});
  
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
  
}
