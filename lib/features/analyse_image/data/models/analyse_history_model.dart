import 'package:scanx/features/analyse_image/data/models/analyse_result_model.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_history_entity.dart';

class AnalyseHistoryModel extends AnalyseHistoryEntity {
  const AnalyseHistoryModel({required super.patientsHistoric});

  factory AnalyseHistoryModel.fromJsom(Map json) {
    List jsonList = json['patients_result'];

    return AnalyseHistoryModel(
      patientsHistoric:
          jsonList.map((e) => AnalyseResultModel.fromJsom(e)).toList(),
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'patients_result': patientsHistoric,
    };
  }
}
