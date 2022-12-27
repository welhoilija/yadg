import 'dart:math';

import 'player.dart';

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
    player2 = players[rand.nextInt(players.length)];

    if (player2 != null && player1 == player2) {
      player2 = players[(players.indexOf(player1) + 1) % players.length];
    }
  }

  String getFormattedText() {
    String modifiedText = text.replaceAll('{player}', player1.name);
    if (modifiedText.contains('{player2}') && (player2 != null)) {
      modifiedText = modifiedText.replaceAll('{player2}', player2!.name);
    }

    return modifiedText.replaceAll('{amount}', rand.nextInt(5).toString());
  }
}
