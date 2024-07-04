import 'package:dartz/dartz.dart';

import 'package:mobile/src/core/error/failure.dart';

import 'package:mobile/src/features/auth/domain/entities/login_return_entity.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, LoginReturn>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoginReturn>> otp(int code) {
    // TODO: implement otp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> registerWithEmailPassword(String email, String password) {
    // TODO: implement registerWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> registerWithGoogle() {
    // TODO: implement registerWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword(String password) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
