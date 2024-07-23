import 'package:dartz/dartz.dart';

import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/network/network_info.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';

import 'package:mobile/src/features/auth/domain/entities/login_return_entity.dart';
import 'package:mobile/src/features/auth/domain/entities/reset_password_entity.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfoImpl networkInfo;
  const AuthRepositoryImpl(
      {required this.authRemoteDataSource, required this.networkInfo});

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
  Future<Either<Failure, void>> registerWithEmailPassword(
      String email, String password) {
    // TODO: implement registerWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> registerWithGoogle() {
    // TODO: implement registerWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ResetPasswordEntity>> resetPassword(
      {required String email,
      required String newPassword,
      required String token,
      required String confirmPassword}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.resetPassword(
            email, newPassword, token, confirmPassword);

        return Right(response);
      } catch (e) {
        return left(ResetPasswordFailure(message: 'Could not reset password!'));
      }
    } else {
      return Left(NetworkFailure(message: 'Check your network and try again!'));
      ;
    }
  }
}
