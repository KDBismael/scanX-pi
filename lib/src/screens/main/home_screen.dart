import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.025),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "assets/pfp.jpg",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.02,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr Gnaore Kouame",
                              // Serge
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "Radiologue",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   "Analyse rapide et fiable grâce a l'IA",
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.w800,
                //     color: Colors.black,
                //   ),
                // ),
                SizedBox(height: screenSize.height * 0.03),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(18),
                        child: const Column(
                          children: [
                            Center(
                              child: Text(
                                "16",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "Patients",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.05,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(18),
                        child: const Column(
                          children: [
                            Center(
                              child: Text(
                                "6",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "Infectés",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.03),
                SizedBox(
                  width: screenSize.width,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Soyez plus efficase!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Obtenez des resultats rapide grace a l'IA",
                        style: TextStyle(
                          fontSize: 14.83,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.all(16.88),
                    fixedSize: Size(screenSize.width, screenSize.height * 0.12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.2,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary,
                            )),
                        padding: const EdgeInsets.all(9.88),
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.1,
                        child: Icon(
                          Icons.assignment_turned_in_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 34,
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.03),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Resultats d'analyse",
                            style: TextStyle(
                              fontSize: 23.83,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Voir les resultats des analyses",
                            style: TextStyle(
                              fontSize: 14.83,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "d'aujourd'hui.",
                            style: TextStyle(
                              fontSize: 14.83,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.all(16.88),
                    fixedSize: Size(screenSize.width, screenSize.height * 0.12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.2,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary,
                            )),
                        padding: const EdgeInsets.all(9.88),
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.1,
                        child: Icon(
                          Icons.analytics_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 34,
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.03),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Analyser un patient",
                            style: TextStyle(
                              fontSize: 23.83,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Utilisez la puissance de l'IA",
                            style: TextStyle(
                              fontSize: 14.83,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "pour vos analyse.",
                            style: TextStyle(
                              fontSize: 14.83,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.all(16.88),
                    fixedSize: Size(screenSize.width, screenSize.height * 0.12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.2,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary,
                            )),
                        padding: const EdgeInsets.all(9.88),
                        width: screenSize.width * 0.2,
                        height: screenSize.height * 0.1,
                        child: Icon(
                          Icons.share_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 34,
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.03),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Partager Resultats",
                            style: TextStyle(
                              fontSize: 23.83,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Envoyez les données de vos",
                            style: TextStyle(
                              fontSize: 14.83,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "patients à d'autres medecin.",
                            style: TextStyle(
                              fontSize: 14.83,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
