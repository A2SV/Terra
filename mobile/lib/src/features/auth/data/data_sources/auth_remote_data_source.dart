import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);

  Future<void> verifyOtp(String code, String email);
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  });
  Future<void> forgotPassword(String email);
  Future<void> resendOTP(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _client.post(
        Uri.parse(AppStrings.loginUrl),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        final responseData = jsonDecode(response.body);
        throw ApiException(responseData['message']);
      }

      final responseData = jsonDecode(response.body);
      final user = responseData['user'];
      return UserModel.fromJson(user);
    } catch (e) {
      if (e is ApiException) {
        throw ServerException(e.message);
      }
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> verifyOtp(String otp, String email) async {
    try {
      final response = await _client.post(
        Uri.parse(AppStrings.verifyOtp),
        body: jsonEncode({
          'email': email,
          'otp': otp,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        final responseData = jsonDecode(response.body);
        throw ApiException(responseData['message']);
      }
    } catch (e) {
      if (e is ApiException) {
        throw ServerException(e.message);
      }
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(AppStrings.registerUrl),
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
        }),
      );

      if (response.statusCode != 201) {
        final data = jsonDecode(response.body);
        throw ApiException(data['message']);
      }
    } catch (e) {
      if (e is ApiException) {
        throw ServerException(e.message);
      }
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final result = await _client.post(
        Uri.parse(AppStrings.forgotPasswordEndpoint),
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
        }),
      );

      if (result.statusCode != 200) {
        final response = jsonDecode(result.body);
        throw ApiException(response['message']);
      }
    } catch (e) {
      if (e is ApiException) {
        throw ServerException(e.message);
      }
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> resendOTP(String email) async {
    try {
      final result = await _client.post(
        Uri.parse(AppStrings.resendOTPEndpoint),
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
        }),
      );

      if (result.statusCode == 500) {
        throw const ServerException("Internal Server Error");
      }

      if (result.statusCode != 200) {
        final response = jsonDecode(result.body);
        throw ResendOTPException(message: response['message']);
      }
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.message);
      }
      throw ServerException(e.toString());
    }
  }
}
