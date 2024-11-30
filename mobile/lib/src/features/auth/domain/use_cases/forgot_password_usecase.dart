import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

class ForgotPasswordUsecase implements UseCase<void, ForgotPasswordParams> {
  ForgotPasswordUsecase({
    required this.authRepository,
  });
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(ForgotPasswordParams params) async {
    return await authRepository.forgotPassword(params.email);
  }
}

class ForgotPasswordParams {
  final String email;

  ForgotPasswordParams({
    required this.email,
  });
}
