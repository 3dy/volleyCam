import 'package:uuid/uuid.dart';

import '../models/match.dart';
import '../models/set_score.dart';
import '../models/team.dart';

class MatchService {

  final _uuid = const Uuid();

  Match createMatch({
    required String home,

    required String away,

    required String category,

    required MatchType type,
  }) {

    return Match(
      id: _uuid.v4(),

      homeTeam: Team(name: home),

      awayTeam: Team(name: away),

      category: category,

      matchType: type,

      status: MatchStatus.notStarted,

      createdAt: DateTime.now(),

      sets: const [
        SetScore(),
      ],
    );

  }

}