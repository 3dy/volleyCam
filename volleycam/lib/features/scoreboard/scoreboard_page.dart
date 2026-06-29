import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import '../../core/providers/current_match_provider.dart';
import '../../core/providers/event_factory_provider.dart';
import '../../core/models/match.dart';
import '../../core/events/point_reason.dart';
import 'widgets/team_score.dart';
import 'widgets/sets_indicator.dart';
import 'widgets/completed_sets_widget.dart';



class ScoreboardPage extends ConsumerStatefulWidget  {
  const ScoreboardPage({super.key});

  @override
  ConsumerState<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends ConsumerState<ScoreboardPage> {

  void _homeScores() {
    HapticFeedback.selectionClick(); //this will make the mobile to vibrate
    final engine = ref.read(currentMatchProvider);

    if (engine == null) return;

    final factory = ref.read(eventFactoryProvider);

    final event = factory.homePoint(
      reason: PointReason.unknown,
      setNumber: engine.state.currentSet,
    );

    setState(() {
      engine.processEvent(event);

      debugPrint(
        "Eventos registrados: ${engine.events.length}",
      );
    });
  }

  void _awayScores() {
    HapticFeedback.selectionClick(); //this will make the mobile to vibrate
    final engine = ref.read(currentMatchProvider);

    if (engine == null) return;

    final factory = ref.read(eventFactoryProvider);

    final event = factory.awayPoint(
      reason: PointReason.unknown,
      setNumber: engine.state.currentSet,
    );

    setState(() {
      engine.processEvent(event);

      debugPrint(
        "Eventos registrados: ${engine.events.length}",
      );
    });
  }

  void _undoLastEvent() {
    final engine = ref.read(currentMatchProvider);

    if (engine == null) return;

    setState(() {
      engine.undoLastEvent();
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
      actions: [
        IconButton(
          icon: const Icon(Icons.undo),
          onPressed: _undoLastEvent,
        ),
      ],
    ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Text(
              "SET ${engine.state.currentSet}",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                TeamScore(
                  teamName: engine.state.match.homeTeam.name,
                  score: engine.state.homeScore,
                  onPressed: _homeScores,
                ),

                const SizedBox(width: 12),

                TeamScore(
                  teamName: engine.state.match.awayTeam.name,
                  score: engine.state.awayScore,
                  onPressed: _awayScores,
                ),
              ],
            ),
            const SizedBox(height: 20),

            SetsIndicator(
              home: engine.state.homeSetsWon,
              away: engine.state.awaySetsWon,
            ),

            const SizedBox(height: 20),

            CompletedSetsWidget(
              completedSets: engine.state.completedSets,
            ), 

            // aquí irán más widgets...

          ],
        ),
      )
      
    );
  }
}