import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/match.dart';

final currentMatchProvider = StateProvider<Match?>(
  (ref) => null,
);