import 'package:dartz/dartz.dart';
import 'package:scanx/core/utils/errors/failure.dart';
import 'package:scanx/features/auth/domain/entities/signin_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> signIn(SigninEntity params);
}
