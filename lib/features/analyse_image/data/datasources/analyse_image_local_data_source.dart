import 'dart:convert';

import 'package:scanx/core/utils/errors/failure.dart';
import 'package:scanx/features/analyse_image/data/models/analyse_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AnalyseImageLocalDataSource {
  Future<AnalyseResultModel> getLastAnlyseResult();
  Future<void> cacheAnalyseResult(AnalyseResultModel patientResult);
}

const String CACHED_DATA_KEY = "LAST_PATIENT_ANALYSE_RESULT";

class AnalyseImageLocalDataSourceImpl implements AnalyseImageLocalDataSource {
  final SharedPreferences sharedPreferences;
  const AnalyseImageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheAnalyseResult(patientResult) async {
    final result = json.encode(patientResult.tojson());
    sharedPreferences.setString(CACHED_DATA_KEY, result);
  }

  @override
  Future<AnalyseResultModel> getLastAnlyseResult() async {
    final jsonString = sharedPreferences.getString(CACHED_DATA_KEY);
    if (jsonString != null) {
      return AnalyseResultModel.fromJsom(json.decode(jsonString));
    } else {
      throw Failure("no cached data found!");
    }
  }
}
