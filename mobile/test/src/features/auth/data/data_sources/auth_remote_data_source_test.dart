import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements HttpClient {}

void main() {
  late MockClient client; //dependency
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  setUp(() {
    client = MockClient();
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(client);
  });
  group('registerWithEmailPassword', () {
    test('', () {});
  });
}
