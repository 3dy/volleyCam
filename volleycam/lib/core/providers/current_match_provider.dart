import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../engine/volley_engine.dart';

final currentMatchProvider =
    StateProvider<VolleyEngine?>((ref) {
  return null;
});