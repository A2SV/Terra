
import 'package:dartz/dartz.dart';
import 'package:mobile/src/features/auth/data/models/UserModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource{
  Future<Either<String,UserLoginModel>> login(String username,String password);
}

String token='token';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<Either<String, UserLoginModel>> login (String username, String password) async {
    String url='api link';

    final response=await http.post(
        Uri.parse(url),
      body: {
          'username':username,
        'password':password
      },
      headers: {
          'Content-Type':'application/json',
        'Authorization':'Bearer $token'
      }
    );
    if (response.statusCode==200){
      return Right(UserLoginModel(username: username,password: password));
    }else{
      return Left('Server Lookup Failed');
    }
  }
}