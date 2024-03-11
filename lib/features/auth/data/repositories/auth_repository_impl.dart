import 'package:dartz/dartz.dart';
import 'package:scanx/core/utils/errors/failure.dart';
import 'package:scanx/features/auth/data/data%20source/auth_remote_data_source.dart';
import 'package:scanx/features/auth/domain/entities/signin_entity.dart';
import 'package:scanx/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, dynamic>> signIn(SigninEntity params) async {
    final res = await remoteDataSource.signin(params);
    return Right(res);
  }
}
