import 'match_state.dart';
import '../models/match.dart';

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
  bool homeWonSet(MatchState state) {
  return state.homeScore > state.awayScore;
  }

  bool awayWonSet(MatchState state) {
    return state.awayScore > state.homeScore;
  }

  bool isMatchFinished(MatchState state) {
    final requiredSets =
        state.match.matchType == MatchType.bestOf3 ? 2 : 3;

    return state.homeSetsWon >= requiredSets ||
        state.awaySetsWon >= requiredSets;
  }
}