class SetState {
  final int number;

  final int homePoints;

  final int awayPoints;

  final bool finished;

  const SetState({
    required this.number,
    this.homePoints = 0,
    this.awayPoints = 0,
    this.finished = false,
  });

  SetState copyWith({
    int? homePoints,
    int? awayPoints,
    bool? finished,
  }) {
    return SetState(
      number: number,
      homePoints: homePoints ?? this.homePoints,
      awayPoints: awayPoints ?? this.awayPoints,
      finished: finished ?? this.finished,
    );
  }
}


class MatchState {
  final Match match;

  final List<SetState> sets;

  final int currentSetIndex;

  const MatchState({
    required this.match,
    required this.sets,
    this.currentSetIndex = 0,
  });

  SetState get currentSet => sets[currentSetIndex];
}