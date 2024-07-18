import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile/src/features/auth/domain/use_cases/register_with_email_password_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository; //dependency
  late RegisterWithEmailPasswordUseCase useCase;
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = RegisterWithEmailPasswordUseCase(mockAuthRepository);
  });

  final params = RegisterWithEmailPasswordUseCaseParams(
    firstName: 'firstName',
    lastName: 'lastName',
    email: 'email',
    password: 'password',
    phoneNumber: 'phoneNumber',
    role: 'role',
  );
  group('Register With Email Password tests', (){
      test(
      "Should test that the AuthRepository.registerWithEmailPassword"
      "is called once and Returns a void", () async {
    //arrange
    when(() => mockAuthRepository.registerWithEmailPassword(
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          phoneNumber: any(named: 'phoneNumber'),
          role: any(named: 'role'),
        )).thenAnswer((_) async => const Right(null));
    //act
    final result = await useCase(params);

    //assert
    verify(
      () => mockAuthRepository.registerWithEmailPassword(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        phoneNumber: params.phoneNumber,
        role: params.role,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockAuthRepository);

    expect(result, isA<void>());
  });

  test(
      'should return An APIFailure when the registerWithEmailPassword usecase Fails',
      () async {
    //arrange
    when(() => mockAuthRepository.registerWithEmailPassword(
              firstName: any(named: 'firstName'),
              lastName: any(named: 'lastName'),
              email: any(named: 'email'),
              password: any(named: 'password'),
              phoneNumber: any(named: 'phoneNumber'),
              role: any(named: 'role'),
            ))
        .thenAnswer(
            (_) async => const Left(APIFailure("Failed To Register User")));

    //act
    final result = await useCase(params);

    //assert
    verify(
      () => mockAuthRepository.registerWithEmailPassword(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        phoneNumber: params.phoneNumber,
        role: params.role,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
    expect(result, const Left(APIFailure("Failed To Register User")));
  });

  });

}
