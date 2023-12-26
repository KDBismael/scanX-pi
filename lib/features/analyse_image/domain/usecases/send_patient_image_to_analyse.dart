import 'package:dartz/dartz.dart';
import 'package:scanx/core/domain/usecases/base_usecase.dart';
import 'package:scanx/core/utils/errors/failure.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_result_entity.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_entity.dart';
import 'package:scanx/features/analyse_image/domain/repositories/analyse_image_repository.dart';

class SendPatientImageToAnalyse
    extends BaseUsecase<AnalyseResultEntity, PatientEntity> {
  AnalyseImageRepository repository;

  SendPatientImageToAnalyse({required this.repository});
  @override
  Future<Either<Failure, AnalyseResultEntity>> call(params) async {
    return await repository.sendPatientImageToAnalyse(params);
  }
}
