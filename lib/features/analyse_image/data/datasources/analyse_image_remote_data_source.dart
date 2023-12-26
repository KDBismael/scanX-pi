import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scanx/features/analyse_image/data/models/analyse_history_model.dart';
import 'package:scanx/features/analyse_image/data/models/analyse_result_model.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_entity.dart';

abstract class AnalyseImageRemoteDataSource {
  Future<AnalyseResultModel> sendPatientImageToAnalyse(PatientEntity patient);
  Future<AnalyseHistoryModel> getPatientsHistoric();
}

class AnalyseImageRemoteDataSourceImpl implements AnalyseImageRemoteDataSource {
  @override
  Future<AnalyseHistoryModel> getPatientsHistoric() async {
    final res =
        await rootBundle.loadString("assets/patient_result.json", cache: true);
    final patientsResult = json.decode(res)['historical_result'];
    return AnalyseHistoryModel.fromJsom(patientsResult);
  }

  @override
  Future<AnalyseResultModel> sendPatientImageToAnalyse(
      PatientEntity patient) async {
    final res =
        await rootBundle.loadString("assets/patient_result.json", cache: true);
    final patientResult = json.decode(res)['patient_result'];
    return AnalyseResultModel.fromJsom(patientResult);
  }
}
