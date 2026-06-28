import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../engine/volley_engine.dart';

class MatchController extends Notifier<VolleyEngine?> {

  @override
  VolleyEngine? build() {
    return null;
  }

}

final matchControllerProvider =
    NotifierProvider<MatchController, VolleyEngine?>(
      MatchController.new,
    );