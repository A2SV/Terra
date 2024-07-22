import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';

import '../../../../core/error/failure.dart';
import '../models/UserModel.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  });

  Future<Either<Failure,UserModel>> login(String username,String password);

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }) async {
      final result  = await _client.post(Uri.parse('$baseUrl$registerUrl'),
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
          'role': role,
        }));
        
        if(result.statusCode != 201){
          final response = jsonDecode(result.body);
          print(response['message']);
          throw ApiException(response['message']);
          
        } 

  }

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
      return  Left(LoginFailure('User Login Failed'));
    }
    else if(response.statusCode==500){
      print(response.body);
      return Left(ServerFailure('Server Failure'));
    }else{
      print(response.body);
      return Left(NetworkFailure('Network Failure, try configuring your network settings'));
    }

  }
}
