import 'package:flutter/material.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_result_entity.dart';
import 'package:scanx/features/analyse_image/presentation/widgets/analyse_result_card.dart';

class AnalyseHistoricScreen extends StatelessWidget {
  const AnalyseHistoricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.025),
              const Text(
                "Historique Des Resultats",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const AnalyseResultCard(
                      patientResult: AnalyseResultEntity(
                          id: 1,
                          npeumoniaType: "viral",
                          patientAffected: true,
                          patientName: "Konan Mars"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
