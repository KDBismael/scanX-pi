import 'package:equatable/equatable.dart';

class AnalyseResultEntity extends Equatable {
  final String id;
  final String npeumoniaType;
  final bool patientAffected;
  final String patientName;
  const AnalyseResultEntity({
    required this.patientName,
    required this.patientAffected,
    required this.npeumoniaType,
    required this.id,
  });

  @override
  List<Object> get props => [patientName, patientAffected, npeumoniaType];
}
