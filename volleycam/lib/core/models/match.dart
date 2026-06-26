import 'team.dart';
import 'set_score.dart';

enum MatchType {
  bestOf3,
  bestOf5,
}

enum MatchStatus {
  notStarted,
  inProgress,
  finished,
}

class Match {
  final Team homeTeam;
  final Team awayTeam;

  final MatchType matchType;

  final MatchStatus status;

  final List<SetScore> sets;

  const Match({
    required this.homeTeam,
    required this.awayTeam,
    required this.matchType,
    required this.status,
    required this.sets,
  });
}