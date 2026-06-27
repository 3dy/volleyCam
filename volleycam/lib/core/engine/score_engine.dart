import 'match_state.dart';

class ScoreEngine {

  MatchState homeScores(MatchState state) {

    return state.copyWith(
      homeScore: state.homeScore + 1,
    );

  }

  MatchState awayScores(MatchState state) {

    return state.copyWith(
      awayScore: state.awayScore + 1,
    );

  }

}