import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/success/success.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginReturn>> login(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, OTPMatched>> otp(String code, String email);
  Future<Either<Failure, void>> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  });
  Future<Either<Failure, void>> registerWithGoogle();
  Future<Either<Failure, OTPSent>> resendOtp(String email);
  Future<Either<Failure, void>> resetPassword(String password);
}
