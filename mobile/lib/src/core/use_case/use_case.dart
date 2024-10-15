import 'package:dartz/dartz.dart';
import 'package:mobile/src/core/error/failure.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
