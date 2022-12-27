import 'dart:math';

import 'package:yadg/backend/backend.dart';

class Card {
  final rand = Random();

  late String emoji;
  late String text;
  late Player player1;
  late Player? player2;

  Card(Map<String, dynamic> json, List<Player> players) {
    emoji = json['emoji'];
    text = json['text'];

    player1 = players[rand.nextInt(players.length)];
    player2 = rand.nextBool() ? players[rand.nextInt(players.length)] : null;
  }

  String getFormattedText() {
    String modifiedText = text.replaceAll('{player}', player1.name);
    if (player2 != null) {
      modifiedText = modifiedText.replaceAll('{player}', player2!.name);
    }

    return modifiedText.replaceAll('{amount}', rand.nextInt(5).toString());
  }
}
