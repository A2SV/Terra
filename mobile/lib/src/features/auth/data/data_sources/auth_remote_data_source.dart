import 'package:http/http.dart' as http;
import 'package:mobile/src/core/constants/AppConstants.dart';
import 'package:mobile/src/core/error/exception.dart';

abstract class AuthRemoteDataSource {
  Future<String> resetPassword(String email, String newPassword);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<String> resetPassword(String email, String newPassword) async {
    String token = ""; //get token from otp
    final response = await http.post(
        Uri.parse(AppConstants.resetPasswordEndpoint),
        body: {"email": email, "token": token, "newPassword": newPassword});
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ResetPasswordException();
  }
}
