<<<<<<< Updated upstream:mobile/lib/src/features/auth/data/data_sources/auth_remote_data_source.dart
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<void> registerWithEmailPassword({
    required String? firstName,
    required String? lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }) async {
    throw UnimplementedError();
    }
}
=======
>>>>>>> Stashed changes:lib/src/features/auth/data/data_sources/auth_remote_data_source.dart
