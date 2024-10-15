import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/success/success.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

class OTPResendParams extends Equatable {
  final String email;

  const OTPResendParams({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class OTPResendUseCase implements UseCase<OTPSent, OTPResendParams> {
  final AuthRepository _authRepository;
  OTPResendUseCase(
    this._authRepository,
  );

  @override
  Future<Either<Failure, OTPSent>> call(OTPResendParams params) {
    return _authRepository.resendOtp(params.email);
  }
}
