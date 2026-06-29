import 'package:flutter_test/flutter_test.dart';

import 'package:volleycam/core/engine/match_state.dart';
import 'package:volleycam/core/engine/volley_engine.dart';
import 'package:volleycam/core/events/event_factory.dart';
import 'package:volleycam/core/events/point_reason.dart';
import 'package:volleycam/core/models/match.dart';
import 'package:volleycam/core/models/set_score.dart';
import 'package:volleycam/core/models/team.dart';

VolleyEngine createEngine() {

  final match = Match(
    id: "test",
    homeTeam: const Team(
      id: "1",
      name: "Home",
    ),
    awayTeam: const Team(
      id: "2",
      name: "Away",
    ),
    matchType: MatchType.bestOf3,
    status: MatchStatus.notStarted,
    createdAt: DateTime.now(),
    category: "Libre",
    sets: const [
      SetScore(),
    ],
  );

  return VolleyEngine(
    state: MatchState(match: match),
  );
}

void main() {

  test("Home suma un punto", () {

    final engine = createEngine();

    final factory = EventFactory();

    engine.processEvent(
      factory.homePoint(
        reason: PointReason.unknown,
        setNumber: 1,
      ),
    );

    expect(engine.state.homeScore, 1);

    expect(engine.state.awayScore, 0);

  });

}