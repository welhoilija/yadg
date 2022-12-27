import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'card.dart';
import 'player.dart';

void main() {}

class Backend {
  // Add players with this

  late List<Player> players;
  late List<dynamic> cards;
  late List<dynamic> punishCards;
  Backend(this.players) {
    fetchCards();
    fetchPunishCards();
  }

  // Function to fetch the JSON file
  void fetchCards() {
    final file = File('./cards.json');
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      cards = jsonDecode(contents);
    } else {
      throw Exception('Cards file not found');
    }
  }

  void fetchPunishCards() {
    final file = File('./punishcards.json');
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      punishCards = jsonDecode(contents);
    } else {
      throw Exception('Cards file not found');
    }
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

  List<Player> getPlayers() {
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
    final rand = Random();
    final players = getPlayers();
    var card = Card(cards[rand.nextInt(cards.length)], players);
    if (players[0].failedCards > 5) {
      card = Card(punishCards[rand.nextInt(punishCards.length)], players);
      players[0].failedCards = 0;
    }
    return card;
  }
}
