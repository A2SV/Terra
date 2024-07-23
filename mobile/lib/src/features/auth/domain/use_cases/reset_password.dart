import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/entities/reset_password_entity.dart';
import 'package:mobile/src/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordParams extends NoParams {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final String token;

  ResetPasswordParams(
      {required this.email,
      required this.newPassword,
      required this.confirmPassword,
      required this.token});
}

class ResetPasswordUseCase
    extends UseCase<ResetPasswordEntity, ResetPasswordParams> {
  
  final AuthRepository authRepository;

  ResetPasswordUseCase({required this.authRepository});

  @override
  Future<Either<Failure, ResetPasswordEntity>> call(
      ResetPasswordParams params) async {
    //  call reset password with params
    final response = await authRepository.resetPassword(
        email: params.email,
        newPassword: params.newPassword,
        confirmPassword: params.confirmPassword,
        token: params.token);
    return response;
  }
}
