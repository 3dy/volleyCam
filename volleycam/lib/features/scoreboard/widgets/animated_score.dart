import 'package:flutter/material.dart';

class AnimatedScore extends StatelessWidget {
  final int score;

  const AnimatedScore({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),

      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },

      child: Text(
        "$score",
        key: ValueKey(score),
        style: const TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}