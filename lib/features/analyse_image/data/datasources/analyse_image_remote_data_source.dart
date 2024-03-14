import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scanx/core/utils/network/network.dart';
import 'package:scanx/features/analyse_image/data/models/analyse_history_model.dart';
import 'package:scanx/features/analyse_image/data/models/analyse_result_model.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_entity.dart';

abstract class AnalyseImageRemoteDataSource {
  Future<AnalyseResultModel> sendPatientImageToAnalyse(PatientEntity patient);
  Future<AnalyseHistoryModel> getPatientsHistoric();
}

class AnalyseImageRemoteDataSourceImpl implements AnalyseImageRemoteDataSource {
  final NetworkRequest network;

  AnalyseImageRemoteDataSourceImpl({required this.network});

  @override
  Future<AnalyseHistoryModel> getPatientsHistoric() async {
    final res =
        await rootBundle.loadString("assets/patient_result.json", cache: true);
    final patientsResult = json.decode(res);
    return AnalyseHistoryModel.fromJsom(patientsResult);
  }

  @override
  Future<AnalyseResultModel> sendPatientImageToAnalyse(
      PatientEntity patient) async {
    final patientResult = await network.analyse("predictions/predict", patient);
    // final res =
    //     await rootBundle.loadString("assets/patient_result.json", cache: true);

    // final patientResult = json.decode(res)['patient_result'];

    return AnalyseResultModel.fromJsom(patientResult);
  }
}
