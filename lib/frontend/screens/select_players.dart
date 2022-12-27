import 'package:flutter/material.dart';

class PlayerSelection extends StatefulWidget {
  const PlayerSelection({super.key});

  @override
  State<PlayerSelection> createState() => _PlayerSelectionState();
}

class _PlayerSelectionState extends State<PlayerSelection> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("🍺"),
      ),
    );
  }
}
