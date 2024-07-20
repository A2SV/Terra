

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/features/auth/domain/use_cases/use_cases.dart';
import 'package:mobile/src/features/auth/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterWithEmailPassword extends Mock
    implements RegisterWithEmailPasswordUseCase {}

void main() {
  late RegisterWithEmailPasswordUseCase usecase;
  late AuthenticationBloc bloc;
  final params = RegisterWithEmailPasswordUseCaseParams(
      firstName: "firstName",
      lastName: "lastName",
      email: "email",
      password: "password",
      phoneNumber: "phoneNumber",
      role: "role");

  setUp(() {
    usecase = MockRegisterWithEmailPassword();
    bloc = AuthenticationBloc(registerWithEmailPasswordUseCase: usecase);
    registerFallbackValue(params);
  });
  tearDown(() => bloc.close());
  test('initial state should be [AuthenticationInitial]', () async {
    expect(bloc.state, AuthenticationInitial());
  });

  // Define the test group
  group('Register With Email Password tests', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'should emit [AuthenticationLoading, AuthenticationSuccess]',
      build: () {
       
        when(() => usecase(any())).thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) async => bloc.add(AuthenticationRegisterUserEvent(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        phoneNumber: params.phoneNumber,
        role: params.role,
      )),
      expect: () => [
        AuthenticationLoading(),
        AuthenticationSuccess(),
      ],
      verify: (_) {
 
        verify(() => usecase(any())).called(1);
        verifyNoMoreInteractions(usecase);
      },
    );
  
    blocTest<AuthenticationBloc, AuthenticationState>(
      'should emit [AuthenticationLoading, AuthenticationSuccess]',
      build: () {
      
        when(() => usecase(any())).thenAnswer((_) async => const Left(APIFailure('Failed')));
        return bloc;
      },
      act: (bloc) async => bloc.add(AuthenticationRegisterUserEvent(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        phoneNumber: params.phoneNumber,
        role: params.role,
      )),
      expect: () => [
        AuthenticationLoading(),
        AuthenticationError('Failed'),
      ],
      verify: (_) {
     
        verify(() => usecase(any())).called(1);
        verifyNoMoreInteractions(usecase);
      },
    );
  });
  
}
