class ApiException implements Exception {
  final String message;
  const ApiException(this.message);
}

class OTPException implements Exception {
  final String message;
  OTPException({required this.message});
  @override
  String toString() => message;
}

class PasswordException implements Exception {
  final String message;
  const PasswordException(this.message);
}

class ResendOTPException implements Exception {
  final String message;
  ResendOTPException({required this.message});
  @override
  String toString() => message;
}
