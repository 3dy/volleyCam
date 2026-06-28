import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/current_match_provider.dart';
import '../../core/models/match.dart';



class ScoreboardPage extends ConsumerStatefulWidget  {
  const ScoreboardPage({super.key});

  @override
  ConsumerState<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends ConsumerState<ScoreboardPage> {

  void _homeScores() {
    final engine = ref.read(currentMatchProvider);

    if (engine == null) return;

    setState(() {
      engine.homeScores();
    });
  }

  void _awayScores() {
    final engine = ref.read(currentMatchProvider);

    if (engine == null) return;

    setState(() {
      engine.awayScores();
    });
  }
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

            Text(
              "SET ${engine.state.currentSet}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              engine.state.match.matchType == MatchType.bestOf3
                  ? "Best of 3"
                  : "Best of 5",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Sets: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("0 - 0"),
              ],
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Expanded(
                  child: Text(
                    engine.state.match.homeTeam.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Text(
                    engine.state.match.awayTeam.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "${engine.state.homeScore}",
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),

                    Text(
                      "${engine.state.awayScore}",
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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

                  onPressed: _homeScores,

                  child: const Text("+ Local"),
                ),

                FilledButton(

                  onPressed: _awayScores,

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