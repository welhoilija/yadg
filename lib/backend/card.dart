import 'dart:math';

import 'player.dart';

class Card {
  final rand = Random();

  late String emoji;
  late String text;

  bool? punishment;

  late Player player1;
  late Player? player2;

  Card(this.emoji, this.text);

  Card.withPlayers(
      this.emoji, this.text, List<Player> players, bool punishment) {
    player1 = players[0];
    if (players.length > 1) {
      player2 = players[1];
    }
    punishment = punishment;
  }

  String getFormattedText() {
    String modifiedText = text.replaceAll('{player}', player1.name);
    if (modifiedText.contains('{player2}') && (player2 != null)) {
      modifiedText = modifiedText.replaceAll('{player2}', player2!.name);
    }
    int amount = rand.nextInt(4) + 1;
    return modifiedText.replaceAll('{amount}', amount.toString());
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
      player2?.successfulCards++;
    }
  }
}
