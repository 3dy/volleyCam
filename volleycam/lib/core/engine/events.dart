enum MatchEventType {
  homePoint,
  awayPoint,
  timeoutHome,
  timeoutAway,
  substitution,
  startSet,
  endSet,
  endMatch,
  undo,
}

class MatchEvent {
  final MatchEventType type;

  final DateTime timestamp;

  final int set;

  final int homeScore;

  final int awayScore;

  const MatchEvent({
    required this.type,
    required this.timestamp,
    required this.set,
    required this.homeScore,
    required this.awayScore,
  });
}