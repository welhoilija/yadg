class Player {
  final String name;
  int failedCards = 0;
  int successfulCards = 0;

  Player(this.name);

  void failCard() => failedCards++;
  void succeedCard() => successfulCards++;
}
