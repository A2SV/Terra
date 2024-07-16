import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginReturn>> login(String email, String password);
<<<<<<< Updated upstream:mobile/lib/src/features/auth/domain/repositories/auth_repository.dart
  Future<Either<Failure,void>> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,});
=======
  Future<Either<Failure,void>> registerWithEmailPassword(String email, String password);
>>>>>>> Stashed changes:lib/src/features/auth/domain/repositories/auth_repository.dart
  Future<Either<Failure,void>> registerWithGoogle();
  Future<Either<Failure,void>> logout();
  Future<Either<Failure,void>> resetPassword(String password);
  Future<Either<Failure, LoginReturn>> otp(int code);
}
