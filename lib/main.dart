import 'package:flutter/material.dart';
import 'package:yadg/frontend/screens/player_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emoji Drinking Game',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PlayerSelection(),
    );
  }
}
