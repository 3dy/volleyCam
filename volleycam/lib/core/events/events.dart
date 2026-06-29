import '../../core/events/point_reason.dart';

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
  final PointReason? pointReason;

  const MatchEvent({
    required this.type,
    this.team,
    this.pointReason,
    required this.timestamp,
    required this.setNumber,
  });
}