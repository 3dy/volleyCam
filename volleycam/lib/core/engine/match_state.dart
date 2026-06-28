import '../models/match.dart';

class MatchState {
  final Match match;

  final int currentSet;

  final int homeScore;

  final int awayScore;

  const MatchState({
    required this.match,
    this.currentSet = 1,
    this.homeScore = 0,
    this.awayScore = 0,
  });

  MatchState copyWith({
    Match? match,
    int? currentSet,
    int? homeScore,
    int? awayScore,
  }) {
    return MatchState(
      match: match ?? this.match,
      currentSet: currentSet ?? this.currentSet,
      homeScore: homeScore ?? this.homeScore,
      awayScore: awayScore ?? this.awayScore,
    );
  }
}