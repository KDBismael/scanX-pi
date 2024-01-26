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
                    // height: screenSize.height,
                    child: Column(
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
                        )
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
