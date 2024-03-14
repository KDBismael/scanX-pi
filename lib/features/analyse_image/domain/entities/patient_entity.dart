import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class PatientEntity extends Equatable {
  const PatientEntity({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.image,
  });

  final String firstName;
  final String lastName;
  final String birthDate;
  final XFile image;

  @override
  List<Object> get props => <Object>[firstName, lastName, birthDate, image];
}
