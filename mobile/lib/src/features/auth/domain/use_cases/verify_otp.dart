import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

class OTPParams extends Equatable {
  final String code;
  final String email;

  const OTPParams({
    required this.email,
    required this.code,
  });

  @override
  List<Object?> get props => [code, email];
}

class VerifyOTPUseCase implements UseCase<void, OTPParams> {
  final AuthRepository _authRepository;
  VerifyOTPUseCase(
    this._authRepository,
  );

  @override
  Future<Either<Failure, void>> call(OTPParams params) async {
    return await _authRepository.verifyOtp(params.code, params.email);
  }
}
