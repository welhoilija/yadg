import 'dart:math';

import 'package:yadg/backend/data/cards.dart';
import 'package:yadg/backend/data/punishcards.dart';

import 'card.dart';
import 'player.dart';

void main() {
  Backend backend = Backend(["BÄLE", "HANKI", "TUPE", "IIGGAZ"]);
  print(backend.getNextCard().getFormattedText());
}

class Backend {
  final Random rand = Random();

  late List<Player> players;

  // List of all cards, without players!
  final List<Card> cards = getCards();
  final List<Card> punishCards = getPunishCards();

  Backend(List<String> array) {
    players = array.map((str) => Player(str)).toList();
  }

  Map<String, Map<String, int>> getCardCounts() {
    final counts = <String, Map<String, int>>{};
    for (final player in players) {
      counts[player.name] = {
        'failed': player.failedCards,
        'success': player.successfulCards
      };
    }
    return counts;
  }

  List<Player> getRandomPlayers() {
    final rand = Random();

    final player1 = players[rand.nextInt(players.length)];
    var player2 = players[rand.nextInt(players.length)];

    // Ensure that player1 and player2 are different
    while (player1 == player2) {
      player2 = players[rand.nextInt(players.length)];
    }

    return [player1, player2];
  }

  Card getNextCard() {
    final List<Player> players = getRandomPlayers();

    Card originalCard = cards[rand.nextInt(cards.length)];
    bool punishment = false;

    if (players[0].failedCards > 5) {
      originalCard = punishCards[rand.nextInt(punishCards.length)];
      players[0].failedCards = 0;
      punishment = true;
    }

    return Card.withPlayers(
        originalCard.emoji, originalCard.text, players, punishment);
  }
}
