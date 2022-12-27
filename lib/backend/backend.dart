import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'card.dart';
import 'player.dart';

void main() {
  Backend backend = Backend(
      [Player("BÄLE"), Player("HANKI"), Player("TUPE"), Player("IIGGAZ")]);
  print(backend.getRandomCard(backend.players));
}

class Backend {
  // Add players with this

  late List<Player> players;
  late List<dynamic> cards;
  Backend(this.players) {
    fetchCards();
  }

  // Path to the JSON file
  final String _path = './cards.json';

  // Function to fetch the JSON file
  void fetchCards() {
    final file = File(_path);
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      cards = jsonDecode(contents);
    } else {
      throw Exception('Cards file not found');
    }
  }

  String getRandomCard(List<Player> players) {
    final rand = Random();
    final card = Card(cards[rand.nextInt(cards.length)], players);

    return card.getFormattedText();
  }
}
