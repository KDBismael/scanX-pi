import 'package:camera/camera.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scanx/core/presentation/provider/global_provider.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_entity.dart';
import 'package:scanx/features/analyse_image/presentation/provider/analyse_image_provider.dart';
import 'package:scanx/features/analyse_image/presentation/screens/camera_preview_screen.dart';

class PatientInputs extends StatefulWidget {
  const PatientInputs({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PatientInputsState();
  }
}

class _PatientInputsState extends State<PatientInputs> {
  DateTime dateNow = DateTime.now();
  final picker = ImagePicker();
  String firstName = "";
  String lastName = "";
  XFile? image;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    int selectedDay = dateNow.day;
    int selectedMonth = dateNow.month;
    int selectedYear = dateNow.year;
    AnalyseImageState analyseState =
        context.watch<AnalyseImageProvider>().state;

    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Entrez les informations du Patient",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Text(
                            'Nom',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            '*',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    hintText: 'Ex: Konan',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      firstName = value;
                    });
                  },
                ),
                SizedBox(height: screenSize.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Text(
                            'Prenom',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            '*',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    hintText: 'Ex: Ismael',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      lastName = value;
                    });
                  },
                ),
                SizedBox(height: screenSize.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text.rich(
                    textAlign: TextAlign.left,
                    TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Text(
                            'Date De Naissance',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            '*',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                DropdownDatePicker(
                  locale: "fr_FR",
                  inputDecoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    hintText: 'Ex: Konan',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ), // optional
                  isDropdownHideUnderline: true, // optional
                  isFormValidator: true, // optional
                  startYear: 1900, // optional
                  endYear: DateTime.now().year, // optional
                  width: 8, // optional
                  selectedDay: selectedDay, // optional
                  selectedMonth: selectedMonth, // optional
                  selectedYear: selectedYear, // optional
                  onChangedDay: (value) {
                    selectedDay = int.parse(value!);
                    print('onChangedDay: $value');
                  },
                  onChangedMonth: (value) {
                    selectedMonth = int.parse(value!);
                    print('onChangedMonth: $value');
                  },
                  onChangedYear: (value) {
                    selectedYear = int.parse(value!);
                    print('onChangedYear: $value');
                  },
                  // optional
                  showDay: true, // optional
                  dayFlex: 2, // optional
                  hintTextStyle:
                      const TextStyle(color: Colors.grey), // optional
                ),
                SizedBox(height: screenSize.height * 0.02),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenSize.width, 50),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    picker.pickImage(source: ImageSource.gallery).then((value) {
                      if (value != null) {
                        setState(() {
                          image = value;
                        });
                      }
                    });

                    // await picker.pickImage(source: ImageSource.camera);

                    // availableCameras().then((value) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (_) => CameraPreviewScreen(cameras: value),
                    //     ),
                    //   );
                    // });
                  },
                  child: const Text(
                    "Prendre une photo",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                Container(
                  height: 100,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Center(
                    child: Text(
                      "Images preview",
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenSize.width, 50),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    context
                        .read<AnalyseImageProvider>()
                        .eitherFailureOrAnalyseResult(
                          patient: PatientEntity(
                            firstName: firstName,
                            lastName: lastName,
                            birthDate:
                                "$selectedDay-$selectedMonth-$selectedYear",
                            image: image!,
                          ),
                        );
                    // print();
                  },
                  child: const Text(
                    "Analyser",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
