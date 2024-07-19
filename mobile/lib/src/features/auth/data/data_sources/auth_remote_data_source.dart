import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/data/models/UserModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource{
  Future<Either<Failure,UserModel>> login(String username,String password);
}



class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<Either<Failure, UserModel>> login (String username, String password) async {
    String url='http://terra.runasp.net/api/Auth/login';


    final response=await http.post(
        Uri.parse(url),
        body: jsonEncode({
          'username':username,
          'password':password
        }),
        headers: {
          'Content-Type':'application/json'
        }
    );
    if (response.statusCode==200){
      //final Box userBox=await Hive.openBox('userData');
      //await userBox.put('isLoggedIn', true);
      print(response.body);
      return Right(UserModel(username: username,password: password));
    }
    else if(response.statusCode==400){
      print(response.body);
      return  Left(LoginFailure());
    }
    else if(response.statusCode==500){
      print(response.body);
      return Left(ServerFailure());
    }else{
      print(response.body);
      return Left(NetworkFailure());
    }

  }
}
