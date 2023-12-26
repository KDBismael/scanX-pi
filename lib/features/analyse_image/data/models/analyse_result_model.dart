import 'package:scanx/features/analyse_image/domain/entities/analyse_result_entity.dart';

class AnalyseResultModel extends AnalyseResultEntity {
  const AnalyseResultModel(
      {required super.patientName,
      required super.patientAffected,
      required super.npeumoniaType,
      required super.id});

  factory AnalyseResultModel.fromJsom(Map json) {
    return AnalyseResultModel(
      npeumoniaType: json['npeumonia_type'],
      patientName: json['patient_name'],
      patientAffected: json['patient_affected'],
      id: json['id'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'patient_name': patientName,
      'npeumonia_type': npeumoniaType,
      'patient_affected': patientAffected,
    };
  }
}
