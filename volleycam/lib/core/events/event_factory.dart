import '../engine/events.dart';
import 'point_reason.dart';

class EventFactory {
  const EventFactory();

  MatchEvent homePoint({
    required PointReason reason,
    required int setNumber,
  }) {
    return MatchEvent(
      type: MatchEventType.point,
      team: TeamSide.home,
      pointReason: reason,
      timestamp: DateTime.now(),
      setNumber: setNumber,
    );
  }

  MatchEvent awayPoint({
    required PointReason reason,
    required int setNumber,
  }) {
    return MatchEvent(
      type: MatchEventType.point,
      team: TeamSide.away,
      pointReason: reason,
      timestamp: DateTime.now(),
      setNumber: setNumber,
    );
  }
}