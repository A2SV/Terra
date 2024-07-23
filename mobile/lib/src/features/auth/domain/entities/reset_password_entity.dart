import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
  final String message;
  final String requestId;
  final bool isSucess;

  const ResetPasswordEntity(
      {required this.message, required this.isSucess, required this.requestId});
  List<Object?> get props => [message, isSucess, requestId];
}
