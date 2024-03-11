import 'package:dartz/dartz.dart';
import 'package:scanx/core/domain/usecases/base_usecase.dart';
import 'package:scanx/core/utils/errors/failure.dart';
import 'package:scanx/features/auth/domain/entities/signin_entity.dart';
import 'package:scanx/features/auth/domain/repositories/auth_repository.dart';

class SigninUsecase extends BaseUsecase<dynamic, SigninEntity> {
  final AuthRepository authRepository;

  SigninUsecase({required this.authRepository});

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return authRepository.signIn(params);
  }
}
