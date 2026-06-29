import 'package:flutter/material.dart';

import 'events.dart';
import 'match_state.dart';
import 'score_engine.dart';
import 'rules_engine.dart';
import '../models/set_score.dart';

class VolleyEngine {

  final ScoreEngine _scoreEngine = ScoreEngine();
  final RulesEngine _rulesEngine = const RulesEngine();
  MatchState state;

  final List<MatchEvent> events = [];

  VolleyEngine({
    required this.state,
  });

  void homeScores() {

    state = _scoreEngine.homeScores(state);

    // events.add(
    //   MatchEvent(
    //     type: MatchEventType.homePoint,
    //     timestamp: DateTime.now(),
    //   ),
    // );
      if (_rulesEngine.isSetFinished(state)) {
        _finishSet();
  }

  }

  void awayScores() {

    state = _scoreEngine.awayScores(state);

    // events.add(
    //   MatchEvent(
    //     type: MatchEventType.awayPoint,
    //     timestamp: DateTime.now(),
    //   ),
    // );
    if (_rulesEngine.isSetFinished(state)) {
        _finishSet();
    }
  }

  void processEvent(MatchEvent event) {
    events.add(event);

    switch (event.type) {
      case MatchEventType.point:
        _processPoint(event);
        break;

      default:
        break;
    }
  }

  void _processPoint(MatchEvent event) {
    if (event.team == TeamSide.home) {
      homeScores();
    } else {
      awayScores();
    }
  }

  void _finishSet() {
    int homeSetsWon = state.homeSetsWon;
    int awaySetsWon = state.awaySetsWon;
    final completedSets = List<SetScore>.from(state.completedSets);

    completedSets.add(
      SetScore(
        homeScore: state.homeScore,
        awayScore: state.awayScore,
      ),
    );

    if (_rulesEngine.homeWonSet(state)) {
      homeSetsWon++;
    } else {
      awaySetsWon++;
    }

    state = state.copyWith(
      completedSets: completedSets,
      homeSetsWon: homeSetsWon,
      awaySetsWon: awaySetsWon,
      currentSet: state.currentSet + 1,
      homeScore: 0,
      awayScore: 0,
    );

    debugPrint(
      "Sets jugados: ${state.completedSets.length}",
    );
  }

}