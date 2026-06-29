import 'package:flutter/material.dart';

class SetsIndicator extends StatelessWidget {

  final int home;

  final int away;

  const SetsIndicator({
    super.key,
    required this.home,
    required this.away,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const Text(
              "Sets",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              "$home - $away",
              style: const TextStyle(
                fontSize: 28,
              ),
            ),

          ],
        ),
      ),
    );
  }
}