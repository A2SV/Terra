import 'dart:io';

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final HttpClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    throw UnimplementedError();
    }
}