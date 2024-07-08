import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/exception.dart';

import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';

import 'package:mobile/src/features/auth/domain/entities/login_return_entity.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);
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
  Future<Either<Failure, void>> registerWithGoogle() {
    // TODO: implement registerWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword(String password) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> registerWithEmailPassword(
      {required String? firstName,
      required String? lastName,
      required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      final result = await _remoteDataSource.registerWithEmailPassword(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          confirmPassword: confirmPassword);
      return Right(result);
    } on ApiException catch (e) {
      return Left(APIFailure(e.message));
    }
  }
}
