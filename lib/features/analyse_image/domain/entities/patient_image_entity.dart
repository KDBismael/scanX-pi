import 'package:equatable/equatable.dart';

class PatientImageEntity extends Equatable {
  const PatientImageEntity({required this.images});
  final List<String> images;

  @override
  List<Object?> get props => [images];
}
