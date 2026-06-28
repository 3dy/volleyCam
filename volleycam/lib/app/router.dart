import 'package:go_router/go_router.dart';
import '../features/home/home_page.dart';
import '../features/create_match/create_match_page.dart';
import '../features/scoreboard/scoreboard_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: '/create-match',
      builder: (context, state) => const CreateMatchPage(),
    ),

    GoRoute(
      path: '/scoreboard',
      builder: (context, state) => const ScoreboardPage(),
    ),
  ],
);