import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  Backend backend = Backend(
      [Player("BÄLE"), Player("HANKI"), Player("TUPE"), Player("IIGGAZ")]);
  final cards = backend.fetchCards();
  print(backend.getRandomCard(cards, backend.players));
}

class Backend {
  // Add players with this
  Backend(this.players);
  List<Player> players;

  // Path to the JSON file
  final String _path = './cards.json';

  // Function to fetch the JSON file
  List<dynamic> fetchCards() {
    final file = File(_path);
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      return jsonDecode(contents);
    } else {
      throw Exception('Cards file not found');
    }
  }

  String getRandomCard(List<dynamic> cards, List<Player> players) {
    final rand = Random();
    final card = cards[rand.nextInt(cards.length)];
    final text = card['text'];
    final emoji = card['emoji'];

    // Select one or two random players
    final player1 = players[rand.nextInt(players.length)];
    final player2 =
        rand.nextBool() ? players[rand.nextInt(players.length)] : null;

    // Modify the text field
    String modifiedText = text.replaceAll('{player}', player1.name);
    if (player2 != null) {
      modifiedText = modifiedText.replaceAll('{player}', player2.name);
    }
    String finalText =
        modifiedText.replaceAll('{amount}', rand.nextInt(5).toString());

    return '$finalText ' + emoji;
  }

  // Function to return a list of text items from the JSON file
  List<dynamic> getTextCards() {
    final cards = fetchCards();
    return cards.map((card) => card['text']).toList();
  }

  // Function to return a list of emoji items from the JSON file
  List<dynamic> getEmojiCards() {
    final cards = fetchCards();
    return cards.map((card) => card['emoji']).toList();
  }
}

class Player {
  final String name;
  int failedCards = 0;
  int successfulCards = 0;

  Player(this.name);

  void failCard() => failedCards++;
  void succeedCard() => successfulCards++;
}
