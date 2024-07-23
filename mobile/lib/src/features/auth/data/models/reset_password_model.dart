import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/auth/domain/entities/reset_password_entity.dart';

class ResetPasswordModel extends ResetPasswordEntity {
 
  
  final String message;
  final String requestId;
  final bool isSucess;

  const ResetPasswordModel(
      {required this.message, required this.isSucess, required this.requestId})
      : super(message: message, isSucess: isSucess, requestId: requestId);

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
        message: json['message'],
        isSucess: json['isSucess'],
        requestId: json['requestId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'isSucess': isSucess,
      'requestId': requestId,
    };
  }
}
