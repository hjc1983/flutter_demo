enum Ico { rock, paper, scissors, man,app }

class Game {
  Ico p1Move;
  Ico p2Move;

  String winner;

  int outcome() {
    return match(p1Move, p2Move);
  }

  int match(Ico hand1, Ico hand2) {
    if (hand1 == Ico.rock) {
      if (hand2 == Ico.rock) return 0;
      if (hand2 == Ico.paper) return 2;
      if (hand2 == Ico.scissors) return 1;
    }
    if (hand1 == Ico.paper) {
      if (hand2 == Ico.rock) return 1;
      if (hand2 == Ico.paper) return 0;
      if (hand2 == Ico.scissors) return 2;
    }
    if (hand1 == Ico.scissors) {
      if (hand2 == Ico.rock) return 2;
      if (hand2 == Ico.paper) return 1;
      if (hand2 == Ico.scissors) return 0;
    }
    return 0;
  }
}
