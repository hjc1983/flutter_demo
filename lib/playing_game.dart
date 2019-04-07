enum HandMove { rock, paper, scissors }

class PlayingGame {
  HandMove player1Move;
  HandMove player2Move;

  String winner;

  int outcome() {
    return match(player1Move, player2Move);
  }

  String outcomeInText() {
    switch (match(player1Move, player2Move)) {
      case 1:
        return ('You Won');
        break;
      case 2:
        return ('Lost');
        break;
      default:
        return ('Draw!');
        break;
    }
  }

  int match(HandMove hand1, HandMove hand2) {
    if (hand1 == HandMove.rock) {
      if (hand2 == HandMove.rock) return 0;
      if (hand2 == HandMove.paper) return 2;
      if (hand2 == HandMove.scissors) return 1;
    }
    if (hand1 == HandMove.paper) {
      if (hand2 == HandMove.rock) return 1;
      if (hand2 == HandMove.paper) return 0;
      if (hand2 == HandMove.scissors) return 2;
    }
    if (hand1 == HandMove.scissors) {
      if (hand2 == HandMove.rock) return 2;
      if (hand2 == HandMove.paper) return 1;
      if (hand2 == HandMove.scissors) return 0;
    }
    return 0;
  }
}
