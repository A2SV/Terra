import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/exception.dart';

import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/network/network_info.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';

import 'package:mobile/src/features/auth/domain/entities/login_return_entity.dart';

import '../../../../core/entities/user_account.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/UserModel.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkImpl network;

  AuthRepositoryImpl({required this.remoteDataSource,
    required this.network,
  });
  @override
  Future<Either<Failure, LoginReturn>> login(String email, String password) async {
    Either<Failure,UserModel> response= await  AuthRemoteDataSourceImpl().login(email, password);

    var output;
    response.fold(
            (failure)=> output = failure,
            (usermodel) => output=LoginReturn(user: UserAccount(username: usermodel.username,password: usermodel.password), token: '')
    );

    if (output is LoginReturn){
      return Right(output);
    }
    else{
      return Left(output);
    }
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
    } on ApiException catch (e) {
      return Left(APIFailure(e.message));
    }

    }
    else {
      return const Left(NetworkFailure('No internet connection. Check Your Internet Connection'));
    }

  }
}
