import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/features/auth/data/models/reset_password_model.dart';


abstract class AuthRemoteDataSource {
  Future<ResetPasswordModel> resetPassword(
      String email, String newPassword, String token, String confirmPassword);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<ResetPasswordModel> resetPassword(String email, String newPassword,
      String token, String confrimPassword) async {
    final response = await client.get(
      '$baseUrl$resetPasswordEndpoint' as Uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ResetPasswordModel.fromJson(json.decode(response.body));
    } else {
      throw ResetPasswordException();
    }
  }
}
