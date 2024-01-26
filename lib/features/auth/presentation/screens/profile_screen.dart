import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List<XFile>? mediaFileList;
    final picker = ImagePicker();
    DateTime dateNow = DateTime(1995, 12, 31);

    int selectedDay = dateNow.day;
    int selectedMonth = dateNow.month;
    int selectedYear = dateNow.year;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: screenSize.height * 0.025),
              const Text(
                "Mon Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: screenSize.width,
                    height: screenSize.height * 0.827,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/user_avatar.png",
                                  height: 90,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(120, 85),
                              child: ElevatedButton(
                                onPressed: () async {
                                  final pickedFile = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  print(pickedFile);
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(20, 20),
                                  elevation: 0,
                                  foregroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                ),
                                // child: Text("h"),
                                child: const Icon(
                                  IconData(
                                    0xf37e,
                                    fontFamily: CupertinoIcons.iconFont,
                                    fontPackage: CupertinoIcons.iconFontPackage,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        const Text(
                          "Gnaore Kouame",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: screenSize.height * 0.001),
                        const Text(
                          "@gnaorekouame",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: screenSize.height * 0.04),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text.rich(
                                  textAlign: TextAlign.start,
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Text(
                                          'Nom Complet',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              TextFormField(
                                initialValue: "Gnaore Kouame",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  hintText: '',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.025),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text.rich(
                                  textAlign: TextAlign.start,
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              TextFormField(
                                initialValue: "gnaore.kouame1@gmail.com",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  hintText: '',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.025),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text.rich(
                                  textAlign: TextAlign.start,
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Text(
                                          'Date de naissance',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              DropdownDatePicker(
                                locale: "fr_FR",
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                inputDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  hintText: 'Ex: Konan',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                                hintTextStyle: const TextStyle(
                                    color: Colors.grey), // optional
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                fixedSize: Size(screenSize.width, 50),
                                side: BorderSide(color: Colors.red),
                              ),
                              child: Text(
                                "Se connecter",
                                style: TextStyle(color: Colors.red),
                              )),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
