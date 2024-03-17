import 'package:dartz/dartz.dart';
import 'package:scanx/core/utils/errors/failure.dart';
import 'package:scanx/features/analyse_image/data/datasources/analyse_image_local_data_source.dart';
import 'package:scanx/features/analyse_image/data/datasources/analyse_image_remote_data_source.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_history_entity.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_result_entity.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_entity.dart';
import 'package:scanx/features/analyse_image/domain/repositories/analyse_image_repository.dart';

class AnalyseImageRepositoryImpl implements AnalyseImageRepository {
  final AnalyseImageRemoteDataSource remoteDataSource;
  final AnalyseImageLocalDataSource localDataSource;

  AnalyseImageRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, AnalyseHistoryEntity>> getPatientsHistoric() async {
    /*
      check internet conection and then send local or remote data but
      but for now just getting the mock data
    */
    // final patientResult = await remoteDataSource.getPatientsHistoric();
    final patientsResult = await remoteDataSource.getPatientsHistoric();
    return Right(patientsResult);
  }

  @override
  Future<Either<Failure, AnalyseResultEntity>> sendPatientImageToAnalyse(
      PatientEntity patient) async {
    /*
      check internet conection and then send local or remote data but
      but for now just getting the mock data
    */
    final patientResult =
        await remoteDataSource.sendPatientImageToAnalyse(patient);
    return Right(patientResult);
  }
}
