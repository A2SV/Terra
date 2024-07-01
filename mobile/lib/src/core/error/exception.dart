class ServerException implements Exception {
  final String? errorMessage;
  ServerException({
    this.errorMessage,
  });
}
