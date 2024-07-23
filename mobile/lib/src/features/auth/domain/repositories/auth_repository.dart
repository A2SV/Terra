import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';
import 'package:mobile/src/features/auth/domain/entities/reset_password_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginReturn>> login(String email, String password);
  Future<Either<Failure, void>> registerWithEmailPassword(
      String email, String password);
  Future<Either<Failure, void>> registerWithGoogle();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, ResetPasswordEntity>> resetPassword(
      {required String email,
      required String newPassword,
      required String token,
      required String confirmPassword});
  Future<Either<Failure, LoginReturn>> otp(int code);
}
