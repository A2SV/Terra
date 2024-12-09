import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/entities/user_account.dart';
import 'package:mobile/src/core/error/failure.dart';
import 'package:mobile/src/core/use_case/use_case.dart';
import 'package:mobile/src/features/auth/domain/domain.dart';

class GetCachedUserUsecase implements UseCase<UserAccount, NoParams> {
  GetCachedUserUsecase({
    required this.authRepository,
  });
  final AuthRepository authRepository;
  @override
  Future<Either<Failure, UserAccount>> call(NoParams params) async {
    return await authRepository.getCacheUser();
  }
}
