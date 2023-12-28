import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_history_entity.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_result_entity.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_entity.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_image_entity.dart';
import 'package:scanx/features/analyse_image/domain/usecases/get_patients_historic.dart';
import 'package:scanx/features/analyse_image/domain/usecases/send_patient_image_to_analyse.dart';

class AnalyseImageProvider with ChangeNotifier {
  AnalyseImageState state = Empty();
  final GetPatientsHistoric getHistoric;
  final SendPatientImageToAnalyse sendImage;

  AnalyseImageProvider({required this.getHistoric, required this.sendImage});

  void eitherFailureOrAnalyseResult() async {
    state = Loading();
    notifyListeners();

    final result = await sendImage(
      const PatientEntity(
        firstName: "patien1",
        lastName: "patient",
        age: 67,
        images: PatientImageEntity(
          images: ['ttt', 'tt'],
        ),
      ),
    );
    result.fold((failure) {
      state = Error(message: failure.message);
      notifyListeners();
    }, (analyseResult) {
      state = PatientResult(patientResult: analyseResult);
      notifyListeners();
    });
  }

  void eitherFailureOrHistoricResults() async {
    state = Loading();
    notifyListeners();

    final patientsResult = await getHistoric(NoParams());
    patientsResult.fold((failure) {
      state = Error(message: failure.message);
      notifyListeners();
    }, (historic) {
      state = PatientHistoricResult(patientsHistoric: historic);
      notifyListeners();
    });
  }
}

abstract class AnalyseImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PatientResult extends AnalyseImageState {
  final AnalyseResultEntity patientResult;
  PatientResult({required this.patientResult});
}

class PatientHistoricResult extends AnalyseImageState {
  final AnalyseHistoryEntity patientsHistoric;
  PatientHistoricResult({required this.patientsHistoric});
}

class Error extends AnalyseImageState {
  final String message;
  Error({required this.message});
}

class Empty extends AnalyseImageState {}

class Loading extends AnalyseImageState {}
