import 'package:dartz/dartz.dart';
import 'package:scanx/core/domain/usecases/base_usecase.dart';
import 'package:scanx/core/utils/errors/failure.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_history_entity.dart';
import 'package:scanx/features/analyse_image/domain/repositories/analyse_image_repository.dart';

class GetPatientsHistoric extends BaseUsecase<AnalyseHistoryEntity, NoParams> {
  AnalyseImageRepository repository;

  GetPatientsHistoric({required this.repository});

  @override
  Future<Either<Failure, AnalyseHistoryEntity>> call(params) async {
    return await repository.getPatientsHistoric();
  }
}

class NoParams {}
