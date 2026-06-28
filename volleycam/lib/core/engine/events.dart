enum MatchEventType {
  point,
  timeout,
  substitution,
  setStarted,
  setFinished,
  matchFinished,
  undo,
}

enum TeamSide {
  home,
  away,
}

class MatchEvent {
  final MatchEventType type;

  final TeamSide? team;

  final DateTime timestamp;

  final int setNumber;

  const MatchEvent({
    required this.type,
    this.team,
    required this.timestamp,
    required this.setNumber,
  });
}