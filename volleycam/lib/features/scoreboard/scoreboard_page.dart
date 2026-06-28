import 'package:flutter/material.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Scoreboard"),
      ),

      body: const Center(
        child: Text(
          "Aquí aparecerá el marcador",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}