import 'package:equatable/equatable.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_result_entity.dart';

class AnalyseHistoryEntity extends Equatable {
  final List<AnalyseResultEntity> patientsHistoric;

  const AnalyseHistoryEntity({required this.patientsHistoric});

  @override
  List<Object?> get props => [patientsHistoric];
}
