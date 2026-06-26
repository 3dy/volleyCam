import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VolleyCam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.sports_volleyball,
              size: 90,
            ),

            const SizedBox(height: 20),

            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Nuevo Partido"),
            ),

            const SizedBox(height: 40),

            const Text(
              "Partidos recientes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text("Aún no hay partidos."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}