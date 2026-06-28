import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/current_match_provider.dart';


class ScoreboardPage extends ConsumerStatefulWidget  {
  const ScoreboardPage({super.key});

  @override
  ConsumerState<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends ConsumerState<ScoreboardPage> {

 
  @override
  Widget build(BuildContext context) {

    final engine = ref.watch(currentMatchProvider);

    if (engine == null) {
    return const Scaffold(
      body: Center(
        child: Text("No hay partido activo"),
      ),
    );
  }

    return Scaffold(

      appBar: AppBar(
        title: const Text("Scoreboard"),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              "SET 1",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Column(
              children: [

                Text(
                  engine.state.match.homeTeam.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "${engine.state.homeScore} - ${engine.state.awayScore}",
                  style: const TextStyle(fontSize: 42),
                ),

                const SizedBox(height: 20),

                Text(
                  engine.state.match.awayTeam.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                FilledButton(

                  onPressed: () {

                    setState(() {
                      engine.homeScores();
                    });

                  },

                  child: const Text("+ Local"),
                ),

                FilledButton(

                  onPressed: () {

                    setState(() {
                      engine.awayScores();
                    });

                  },

                  child: const Text("+ Visitante"),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}