import 'dart:convert';
import 'dart:io';

void main() {
  print(Backend.getTextCards());
}

class Backend {
  // Path to the JSON file
  static const String _path = './cards.json';

  // Function to fetch the JSON file
  static List<dynamic> fetchCards() {
    final file = File(_path);
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      return jsonDecode(contents);
    } else {
      throw Exception('Cards file not found');
    }
  }

  // Function to return a list of text items from the JSON file
  static List<dynamic> getTextCards() {
    final cards = fetchCards();
    return cards.map((card) => card['text']).toList();
  }

  // Function to return a list of emoji items from the JSON file
  static List<dynamic> getEmojiCards() {
    final cards = fetchCards();
    return cards.map((card) => card['emoji']).toList();
  }
}

final textCards = Backend.getTextCards();
