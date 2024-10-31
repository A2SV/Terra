import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/src/core/constants/constants.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

// var baseUrl; //just to fix error of undefined var
// var registerUrl; //just to fix error of undefined var
void main() {
  late MockClient client; //dependency
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  setUp(() {
    client = MockClient();
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(client);
    registerFallbackValue(Uri());
  });
  group('register With Email Password tests', () {
    test('should complete when a call to the server is successfull', () async {
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer(
              (_) async => http.Response('{"message": "success"}', 201));
      await authRemoteDataSourceImpl.registerWithEmailPassword(
          firstName: 'firstName',
          lastName: 'lastName',
          email: 'email',
          password: 'password',
          phoneNumber: 'phoneNumber',
          role: 'role');

      var baseUrl;
      var registerUrl;
      verify(() => client.post(Uri.parse('$baseUrl$registerUrl'),
       headers: {
          'Content-type': 'application/json',
        },
          body: jsonEncode({
            'firstName': 'firstName',
            'lastName': 'lastName',
            'email': 'email',
            'password': 'password',
            'phoneNumber': 'phoneNumber',
            'role': 'role'
          }))).called(1);
      verifyNoMoreInteractions(client);
    });
    test('should throw an ApiException if the status code isn\'t 200',
        () async {
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response('{"message": "Error"}', 404));
      final result = authRemoteDataSourceImpl.registerWithEmailPassword;

      expect(
        () async => result(
            firstName: 'firstName',
            lastName: 'lastName',
            email: 'email',
            password: 'password',
            phoneNumber: 'phoneNumber',
            role: 'role'),
        throwsA(isA<ApiException>()),
      );
      var baseUrl;
      var registerUrl;
      verify(() => client.post(Uri.parse('$baseUrl$registerUrl'),
       headers: {
          'Content-type': 'application/json',
        },
          body: jsonEncode({
            'firstName': 'firstName',
            'lastName': 'lastName',
            'email': 'email',
            'password': 'password',
            'phoneNumber': 'phoneNumber',
            'role': 'role'
          }))).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}
