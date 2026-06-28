import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateMatchPage extends StatelessWidget {
  const CreateMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Partido'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            context.go('/scoreboard');
          },
          child: const Text("Iniciar Partido"),
        ),
      ),
    );
  }
}