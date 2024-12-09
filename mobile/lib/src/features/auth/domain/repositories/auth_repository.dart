import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/entities/user_account.dart';
import 'package:mobile/src/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserAccount>> login(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> verifyOtp(String code, String email);
  Future<Either<Failure, void>> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  });
  Future<Either<Failure, void>> registerWithGoogle();
  Future<Either<Failure, void>> resetPassword(String password);
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>> resendOTP(String email);
  Future<Either<Failure, UserAccount>> getCacheUser();
}
