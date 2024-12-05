import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

class ResendOTPUsecase implements UseCase<void, ResendOTPParams> {
  ResendOTPUsecase({
    required this.authRepository,
  });
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, void>> call(ResendOTPParams params) async {
    return await authRepository.resendOTP(params.email);
  }
}

class ResendOTPParams {
  final String email;

  ResendOTPParams({
    required this.email,
  });
}
