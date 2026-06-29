import 'package:flutter/material.dart';

import '../../../core/models/set_score.dart';

class CompletedSetsWidget extends StatelessWidget {
  final List<SetScore> completedSets;

  const CompletedSetsWidget({
    super.key,
    required this.completedSets,
  });

  @override
  Widget build(BuildContext context) {
    if (completedSets.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Historial de Sets",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...completedSets.asMap().entries.map((entry) {

              final index = entry.key;
              final set = entry.value;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Set ${index + 1}"),

                    Text(
                      "${set.homeScore} - ${set.awayScore}",
                    ),

                  ],
                ),
              );

            }),

          ],
        ),
      ),
    );
  }
}