import 'package:flutter/material.dart';

enum HandMove { rock, paper, scissors }
enum ResultType { rock, paper, scissors, shoot }

class PlayingGame {
  PlayingGame() {
    /*
    {
    this.player1Score,
    this.player2Score,
  }
    */
  }

  int match(HandMove hand1, HandMove hand2) {
    print("Play 1: " + hand1.toString() + ", Play 2: " + hand2.toString());

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
