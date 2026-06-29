import 'package:flutter/material.dart';
import 'animated_score.dart';

class TeamScore extends StatelessWidget {
  final String teamName;
  final int score;
  final VoidCallback onPressed;

  const TeamScore({
    super.key,
    required this.teamName,
    required this.score,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              Text(
                teamName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              AnimatedScore(
                score: score,
              ),

              const SizedBox(height: 20),

              FilledButton(
                onPressed: onPressed,
                child: const Text("+ Punto"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}