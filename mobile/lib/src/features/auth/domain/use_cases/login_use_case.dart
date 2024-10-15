import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/entities/user_account.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

class LoginUseCase implements UseCase<UserAccount, LoginParams> {
  LoginUseCase(
    this._authRepository,
  );
  final AuthRepository _authRepository;
  @override
  Future<Either<Failure, UserAccount>> call(LoginParams params) async {
    return await _authRepository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
