import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  });
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
}
