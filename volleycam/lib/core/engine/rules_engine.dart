import 'match_state.dart';

class RulesEngine {
  const RulesEngine();

  bool isSetFinished(MatchState state) {
    final home = state.homeScore;
    final away = state.awayScore;

    // El quinto set es a 15
    final target = state.currentSet == 5 ? 15 : 25;

    final reachedTarget =
        home >= target || away >= target;

        final twoPointDifference =
        (home - away).abs() >= 2;

    return reachedTarget && twoPointDifference;
  }
}