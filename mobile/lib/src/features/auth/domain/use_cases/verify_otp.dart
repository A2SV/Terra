import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/success/success.dart';
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

class OTPUseCase implements UseCase<OTPMatched, OTPParams> {
  final AuthRepository _authRepository;
  OTPUseCase(
    this._authRepository,
  );

  @override
  Future<Either<Failure, OTPMatched>> call(OTPParams params) {
    return _authRepository.otp(params.code, params.email);
  }
}
