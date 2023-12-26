import 'package:dartz/dartz.dart';
import 'package:scanx/core/utils/errors/failure.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_history_entity.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_result_entity.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_entity.dart';

abstract class AnalyseImageRepository {
  Future<Either<Failure, AnalyseResultEntity>> sendPatientImageToAnalyse(
      PatientEntity patient);
  Future<Either<Failure, AnalyseHistoryEntity>> getPatientsHistoric();
}
