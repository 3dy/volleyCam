import 'events.dart';
import 'match_state.dart';
import 'score_engine.dart';
import 'rules_engine.dart';

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
      print("SET TERMINADO");
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
      print("SET TERMINADO");
  }
  }

}