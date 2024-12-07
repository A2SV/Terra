import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/network/network_info.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkImpl network;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.network,
  });
  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    if (await network.isConnected) {
      try {
        final response = await remoteDataSource.login(email, password);
        return right(response);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure(
          'No internet connection. Check Your Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyOtp(String code, String email) async {
    try {
      final otp = await remoteDataSource.verifyOtp(code, email);
      return Right(otp);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }) async {
    if (await network.isConnected) {
      try {
        final result = await remoteDataSource.registerWithEmailPassword(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            phoneNumber: phoneNumber,
            role: role);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(
        NetworkFailure(
            'No internet connection. Check Your Internet Connection'),
      );
    }
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
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      if (await network.isConnected) {
        await remoteDataSource.forgotPassword(email);
        return const Right(null);
      } else {
        return const Left(NetworkFailure('No internet connection'));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> resendOTP(String email) async {
    try {
      if (await network.isConnected) {
        await remoteDataSource.resendOTP(email);
        return const Right(null);
      } else {
        return const Left(NetworkFailure('No internet connection'));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
