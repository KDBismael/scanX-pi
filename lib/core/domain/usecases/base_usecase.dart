import 'package:dartz/dartz.dart';
import 'package:scanx/core/utils/errors/failure.dart';

abstract class BaseUsecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
