
class ApiException implements Exception{
  final String message;
  const ApiException(this.message);
}

class PasswordException implements Exception{
  final String message;
  const PasswordException(this.message);
}

