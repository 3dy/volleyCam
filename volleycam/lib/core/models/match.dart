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
  final String id;

  final Team homeTeam;

  final Team awayTeam;

  final MatchType matchType;

  final MatchStatus status;

  final List<SetScore> sets;

  final DateTime createdAt;

  final String category;

  const Match({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.matchType,
    required this.status,
    required this.sets,
    required this.createdAt,
    required this.category,
  });
}