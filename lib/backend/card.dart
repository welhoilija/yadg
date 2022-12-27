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

    player1 = players[0];
    if (players.length > 1) {
      player2 = players[1];
    }
  }

  String getFormattedText() {
    String modifiedText = text.replaceAll('{player}', player1.name);
    if (modifiedText.contains('{player2}') && (player2 != null)) {
      modifiedText = modifiedText.replaceAll('{player2}', player2!.name);
    }

    return modifiedText.replaceAll('{amount}', rand.nextInt(5).toString());
  }

  void failCard() {
    player1.failedCards++;
    if (text.contains('{player2}')) {
      player2?.failedCards++;
    }
  }

  void successCard() {
    player1.successfulCards++;
    if (text.contains('{player2}')) {
      player2?.failedCards++;
    }
  }
}
