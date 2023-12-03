import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          // decoration: BoxDecoration(color: Colors.amber),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.10),
                child: Image.asset(
                  "assets/doctor.png",
                  key: const Key("LoginScreenImage"),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenue sur Medical ScanX",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    Text(
                      "Connectez vous pour commencer a analyser les radiographie de vos patients",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.06,
                    ),
                    Form(
                      key: UniqueKey(),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Numero de telephone",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    style: BorderStyle.solid),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.03,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Mot de passe",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    style: BorderStyle.solid),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.03,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.all(16),
                              ),
                              backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            child: const Text("Login"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
