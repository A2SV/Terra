
import 'package:dartz/dartz.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/data/models/UserModel.dart';
import 'package:mobile/src/features/auth/domain/entities/entities.dart';
import 'package:mobile/src/features/auth/domain/repositories/AuthRepository.dart';

abstract class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<String,User>> userLogin(String username, String password) async {
    final results = await AuthRemoteDataSourceImpl().login(username, password);
    var data;

    results.fold(
        (error)=>data=error,
        (usermodel)=>data=usermodel
    );

    if (data is UserLoginModel){
      return Right(User(username: data.username,password: data.password,isAuthorized: true));
    }else{
      return Left(data);
    }

  }
}