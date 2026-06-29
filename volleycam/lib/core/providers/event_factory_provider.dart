import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/event_factory.dart';

final eventFactoryProvider =
    Provider<EventFactory>((ref) {
  return const EventFactory();
});