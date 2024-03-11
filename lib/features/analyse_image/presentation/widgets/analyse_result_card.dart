import 'package:flutter/material.dart';
import 'package:scanx/features/analyse_image/domain/entities/analyse_result_entity.dart';

class AnalyseResultCard extends StatelessWidget {
  const AnalyseResultCard(
      {super.key, required this.patientResult, this.isElevated = false});
  final AnalyseResultEntity patientResult;
  final bool isElevated;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 85,
      padding: const EdgeInsets.all(15),
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        border: isElevated ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary,
                )),
            width: screenSize.width * 0.13,
            height: screenSize.height * 0.06,
            child: Center(
              child: Icon(
                patientResult.patientAffected
                    ? Icons.coronavirus_outlined
                    : Icons.gpp_good_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 34,
              ),
            ),
          ),
          SizedBox(width: screenSize.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  patientResult.patientName,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                patientResult.patientAffected
                    ? Text(
                        "Infection ${patientResult.npeumoniaType}",
                        style: TextStyle(
                            color: Colors.redAccent.shade400, fontSize: 16),
                      )
                    : Text(
                        "Patient saint",
                        style: TextStyle(color: Colors.greenAccent.shade400),
                      ),
              ],
            ),
          ),
          SizedBox(width: screenSize.width * 0.04),
          SizedBox(
            width: 40,
            height: 40,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(0)),
              child: const Icon(
                Icons.share,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
