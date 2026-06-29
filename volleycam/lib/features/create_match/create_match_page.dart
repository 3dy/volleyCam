import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/engine/match_state.dart';
import '../../core/engine/volley_engine.dart';
import '../../core/models/match.dart';
import '../../core/providers/current_match_provider.dart';
import '../../core/services/match_service.dart';

class CreateMatchPage extends ConsumerStatefulWidget {
  const CreateMatchPage({super.key});

  @override
  ConsumerState<CreateMatchPage> createState() =>
      _CreateMatchPageState();
}

class _CreateMatchPageState
    extends ConsumerState<CreateMatchPage> {

  final _homeController = TextEditingController();

  final _awayController = TextEditingController();

  MatchType _matchType = MatchType.bestOf3;

  final _matchService = MatchService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Partido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            TextField(
              controller: _homeController,
              decoration: const InputDecoration(
                labelText: "Equipo Local",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _awayController,
              decoration: const InputDecoration(
                labelText: "Equipo Visitante",
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Formato",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<MatchType>(
              value: MatchType.bestOf3,
              groupValue: _matchType,
              title: const Text("Best of 3"),
              onChanged: (value) {
                setState(() {
                  _matchType = value!;
                });
              },
            ),

            RadioListTile<MatchType>(
              value: MatchType.bestOf5,
              groupValue: _matchType,
              title: const Text("Best of 5"),
              onChanged: (value) {
                setState(() {
                  _matchType = value!;
                });
              },
            ),

            const Spacer(),

            FilledButton(
              onPressed: _startMatch,
              child: const Text("Iniciar Partido"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _homeController.dispose();
    _awayController.dispose();
    super.dispose();
  }

  void _startMatch() {
    
    FocusScope.of(context).unfocus();

    if (_homeController.text.trim().isEmpty ||
      _awayController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Escribe el nombre de ambos equipos.",
          ),
        ),
      );

      return;
    }

    final match = _matchService.createMatch(
      home: _homeController.text,
      away: _awayController.text,
      category: "Libre",
      type: _matchType,
    );

    final engine = VolleyEngine(
      state: MatchState(match: match),
    );

    ref.read(currentMatchProvider.notifier).state = engine;

    context.go('/scoreboard');

  }
  
}

