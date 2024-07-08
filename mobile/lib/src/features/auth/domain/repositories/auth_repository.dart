import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginReturn>> login(String email, String password);
  Future<Either<Failure,void>> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String confirmPassword,});
  Future<Either<Failure,void>> registerWithGoogle();
  Future<Either<Failure,void>> logout();
  Future<Either<Failure,void>> resetPassword(String password);
  Future<Either<Failure, LoginReturn>> otp(int code);
}
