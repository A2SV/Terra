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
      confirmPassword: params.confirmPassword,  

    );
  }
}


class RegisterWithEmailPasswordUseCaseParams {
  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterWithEmailPasswordUseCaseParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
