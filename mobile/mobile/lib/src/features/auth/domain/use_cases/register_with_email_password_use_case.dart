<<<<<<< Updated upstream:mobile/lib/src/features/auth/domain/use_cases/register_with_email_password_use_case.dart
import 'dart:js_interop';

import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';


class RegisterWithEmailPasswordUseCase extends UseCase<void,RegisterWithEmailPasswordUseCaseParams> {
  

  RegisterWithEmailPasswordUseCase(this._authRepository,);
  final AuthRepository _authRepository;
  @override
  Future<Either<Failure, void>> call(RegisterWithEmailPasswordUseCaseParams params){
    return _authRepository.registerWithEmailPassword(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
      phoneNumber: params.phoneNumber,
      role: params.role,

    );
  }
}


class RegisterWithEmailPasswordUseCaseParams {
  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;

  RegisterWithEmailPasswordUseCaseParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });
}
=======
>>>>>>> Stashed changes:lib/src/features/auth/domain/use_cases/register_with_email_password_use_case.dart