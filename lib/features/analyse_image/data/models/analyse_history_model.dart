import 'package:scanx/features/analyse_image/domain/entities/analyse_history_entity.dart';

class AnalyseHistoryModel extends AnalyseHistoryEntity {
  const AnalyseHistoryModel({required super.patientsHistoric});

  factory AnalyseHistoryModel.fromJsom(Map json) {
    return AnalyseHistoryModel(
      patientsHistoric: json['patients_result'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'patients_result': patientsHistoric,
    };
  }
}
