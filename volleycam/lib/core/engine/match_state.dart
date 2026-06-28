import '../models/match.dart';
import '../models/set_score.dart';

class MatchState {
  final Match match;

  final int currentSet;

  final int homeScore;

  final int awayScore;

  // NUEVO
  final int homeSetsWon;

  final int awaySetsWon;

  final List<SetScore> completedSets;

  const MatchState({
    required this.match,
    this.currentSet = 1,
    this.homeScore = 0,
    this.awayScore = 0,
    this.homeSetsWon = 0,
    this.awaySetsWon = 0,
    this.completedSets = const [],
  });

  MatchState copyWith({
    Match? match,
    int? currentSet,
    int? homeScore,
    int? awayScore,
    int? homeSetsWon,
    int? awaySetsWon,
    List<SetScore>? completedSets,
  }) {
    return MatchState(
      match: match ?? this.match,
      currentSet: currentSet ?? this.currentSet,
      homeScore: homeScore ?? this.homeScore,
      awayScore: awayScore ?? this.awayScore,
      homeSetsWon: homeSetsWon ?? this.homeSetsWon,
      awaySetsWon: awaySetsWon ?? this.awaySetsWon,
      completedSets: completedSets ?? this.completedSets,
    );
  }
}