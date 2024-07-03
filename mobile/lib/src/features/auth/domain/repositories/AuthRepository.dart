

import 'package:dartz/dartz.dart';
import 'package:mobile/src/features/auth/domain/entities/entities.dart';

abstract class AuthRepository{
  Future<Either<String,User>> userLogin(String username, String password);
}