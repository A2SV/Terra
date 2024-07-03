import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';

import 'package:mobile/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase {
  final AuthRepository authRepository;

  LoginUseCase({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, dynamic>> call(params) {
    throw UnimplementedError();
  }
}
