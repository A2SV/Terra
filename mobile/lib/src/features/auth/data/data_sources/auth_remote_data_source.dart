import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/core/success/success.dart';
import 'package:mobile/src/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);

  Future<OTPMatched> otp(String code, String email);
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  });
  Future<OTPSent> resendOtp(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<UserModel> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(AppStrings.loginUrl),
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        //final Box userBox=await Hive.openBox('userData');
        //await userBox.put('isLoggedIn',   true);
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> user = responseData['user'];
        return UserModel.fromJson(user);
      } else {
        final responseData = jsonDecode(response.body);
        throw ServerException(responseData['message']);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<OTPMatched> otp(String otp, String email) async {
    final otpResponse = await _client.post(Uri.parse(AppStrings.otpEndPoint),
        body: jsonEncode({'email': email, 'otp': otp}),
        headers: {'Content-Type': ' application/json'});
    if (otpResponse.statusCode != 200) {
      throw ServerException(otpResponse.body);
    }
    return const OTPMatched();
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
      final result = await _client.post(Uri.parse(AppStrings.registerUrl),
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

      if (result.statusCode != 201) {
        final response = jsonDecode(result.body);
        throw ServerException(response['message']);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<OTPSent> resendOtp(String email) async {
    final otpResponse = await _client.post(
        Uri.parse(AppStrings.resendOtpEndPoint),
        body: jsonEncode({'email': email}),
        headers: {'Content-Type': ' application/json'});
    if (otpResponse.statusCode != 200) {
      throw ServerException(otpResponse.body);
    }
    return const OTPSent();
  }
}
