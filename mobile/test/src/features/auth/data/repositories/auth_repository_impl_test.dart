import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/src/core/error/exception.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/network/network_info.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:mobile/src/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile/src/features/auth/domain/use_cases/register_with_email_password_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}
class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}
class MockNetwork extends Mock implements NetworkImpl {}

void main() {
  late MockAuthRemoteDataSource remoteDataSource; //dependency
  late MockAuthLocalDataSource localDataSource;
  late AuthRepositoryImpl authRepositoryImpl;
  late NetworkImpl network;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    network = MockNetwork();
    localDataSource=MockAuthLocalDataSource();
    authRepositoryImpl = AuthRepositoryImpl(remoteDataSource:remoteDataSource,network:network, localDataSource: localDataSource,);
  });
  final params = RegisterWithEmailPasswordUseCaseParams(
    firstName: 'firstName',
    lastName: 'lastName',
    email: 'email',
    password: 'password',
    phoneNumber: 'phoneNumber',
    role: 'role',
  );

  group('register With Email Password tests', () {
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
              phoneNumber: any(named: 'phoneNumber'),
              role: any(named: 'role')))
          .thenAnswer((_) async => Future.value());
      //act
      final result = await authRepositoryImpl.registerWithEmailPassword(
          firstName: params.firstName,
          lastName: params.lastName,
          email: params.email,
          password: params.password,
          phoneNumber: params.phoneNumber,
          role: params.role);

      // //assert
      expect(result, isA<void>());
      verify(
        () => remoteDataSource.registerWithEmailPassword(
            firstName: params.firstName,
            lastName: params.lastName,
            email: params.email,
            password: params.password,
            phoneNumber: params.phoneNumber,
            role: params.role),
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
              phoneNumber: any(named: 'phoneNumber'),
              role: any(named: 'role')
              ))
          .thenThrow(tException);
      //act
      final result = await authRepositoryImpl.registerWithEmailPassword(
          firstName: params.firstName,
          lastName: params.lastName,
          email: params.email,
          password: params.password,
          phoneNumber: params.phoneNumber,
          role: params.role
          );
      //assert
      expect(result, Left(APIFailure(tException.message)));
      verify(() => remoteDataSource.registerWithEmailPassword(
          firstName: params.firstName,
          lastName: params.lastName,
          email: params.email,
          password: params.password,
          phoneNumber: params.phoneNumber,
          role: params.role,
          )).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
