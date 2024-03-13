import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_image_entity.dart';

class PatientEntity extends Equatable {
  const PatientEntity({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.images,
  });

  final String firstName;
  final String lastName;
  final int age;
  final XFile images;

  @override
  List<Object> get props => <Object>[firstName, lastName, age, images];
}
