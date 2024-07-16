import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordParams extends NoParams {
  final String email;
  final String newPassword;

  ResetPasswordParams({required this.email, required this.newPassword});
}

class ResetPasswordUseCase extends UseCase<String, ResetPasswordParams> {
  // initialize repo
  final AuthRepository authRepository;

  ResetPasswordUseCase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(ResetPasswordParams params) async {
    //  call reset password with params
    final response =await authRepository.resetPassword(params.email, params.newPassword);
    return response;
  }
}
