import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/src/features/auth/domain/use_cases/register_with_email_password_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late MockAuthRemoteDataSource remoteDataSource;
  late AuthRepositoryImpl authRepositoryImpl;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    authRepositoryImpl = AuthRepositoryImpl(remoteDataSource);
  });
  final params = RegisterWithEmailPasswordUseCaseParams(
    firstName: 'firstName',
    lastName: 'lastName',
    email: 'email',
    password: 'password',
    confirmPassword: 'confirmPassword',
  );

  group('registerWithEmailPassword', () {
    test(
        'should verify the '
        'datasource.registerWithEmailPassword'
        'gets called once and returns a void', () async {
      //arrange
      when(() => remoteDataSource.registerWithEmailPassword(
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              email: any(named: 'email'),
              password: any(named: 'password'),
              confirmPassword: any(named: 'confirmPassword')))
          .thenAnswer((_) async => Future.value());
      //act
      final result = await authRepositoryImpl.registerWithEmailPassword(
          firstName: params.firstName,
          lastName: params.lastName,
          email: params.email,
          password: params.password,
          confirmPassword: params.confirmPassword);

      // //assert
      expect(result, isA<void>());
      verify(
        () => remoteDataSource.registerWithEmailPassword(
            firstName: params.firstName,
            lastName: params.lastName,
            email: params.email,
            password: params.password,
            confirmPassword: params.confirmPassword),
      ).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
    const tException = ApiException('Failed to register user');
    test(
        'should return an APIFailure when the call'
        'todatasource.registerWithEmailPassword'
        'is unsuccessful', () async {
      //arrange
      when(() => remoteDataSource.registerWithEmailPassword(
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              email: any(named: 'email'),
              password: any(named: 'password'),
              confirmPassword: any(named: 'confirmPassword')))
          .thenThrow(tException);
      //act
      final result = await authRepositoryImpl.registerWithEmailPassword(
          firstName: params.firstName,
          lastName: params.lastName,
          email: params.email,
          password: params.password,
          confirmPassword: params.confirmPassword);
      //assert
      expect(result, Left(APIFailure(tException.message)));
      verify(() => remoteDataSource.registerWithEmailPassword(
          firstName: params.firstName,
          lastName: params.lastName,
          email: params.email,
          password: params.password,
          confirmPassword: params.confirmPassword)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
