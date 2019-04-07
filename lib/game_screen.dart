import 'package:flutter/material.dart';
import 'playing_game.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  GameScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  HandMove player1;
  HandMove player2;
  String winOrLoss;
  int player1Score = 0;
  int player2Score = 0;
  int drawScore = 0;
  int round = 0;

  void _resetGame() {
    player1Score = 0;
    player2Score = 0;
    drawScore = 0;
    round = 0;
  }

  void _startOnePersonGame(HandMove player) {
    int randomNumber = Random().nextInt(3);
    HandMove randomMove = HandMove.values[randomNumber];
    //_roundReset();
    int result = PlayingGame().match(player, randomMove);
    _statusCount(result);

    setState(() {
      player1 = player;
      player2 = randomMove;
      winOrLoss = result == 1 ? "win" : result == 2 ? "lost" : "draw";
      round++;
    });

    print("Round # $round. \n\n");
  }

  void _roundReset() {
    //   if (player1Score > 3 || player2Score > 3 || drawScore > 3) { //useless as i didn't have those in state
    if (round == 5) {
      _resetGame();
      print("\n\nReseting the game \n\n");
    }
  }

  void _statusCount(int result) {
    switch (result) {
      case 1:
        player1Score++;
        print('Play 1 You Won');
        break;

      case 2:
        player2Score++;
        print('Play 2 Won');
        break;
      default:
        drawScore++;
        print('Draw!');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Lets Play'),
        backgroundColor: Colors.orange,
      ),

      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            new Text(
              "Round $round",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
                fontFamily: 'Roboto',
              ),
            ),
            new Row(children: <Widget>[
              Expanded(
                  child: Image.asset("images/" +
                      player1.toString().split('.').last +
                      ".png") //Text("$player1"),
                  ),
              Text(
                '$winOrLoss',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Expanded(
                  child: Image.asset("images/" +
                      player2.toString().split('.').last +
                      ".png") //Text("$player2"),
                  )
            ]),
            new Row(children: <Widget>[
              Expanded(
                  child: Column(children: <Widget>[
                RaisedButton(
                  child: new RotatedBox(
                    quarterTurns: 1,
                    child: Image.asset('images/rock.png'),
                  ),
                  onPressed: () => _startOnePersonGame(HandMove.rock),
                ),
                Text("Rock")
              ])),
              Expanded(
                  child: Column(children: <Widget>[
                RaisedButton(
                  child: Image.asset('images/paper.png'),
                  onPressed: () => _startOnePersonGame(HandMove.paper),
                ),
                Text("Paper")
              ])),
              Expanded(
                  child: Column(children: <Widget>[
                RaisedButton(
                  child: new RotatedBox(
                    quarterTurns: 3,
                    child: Image.asset('images/scissors.png'),
                  ),
                  onPressed: () => _startOnePersonGame(HandMove.scissors),
                ),
                Text("Scissors")
              ]))
            ]),
          ])),
    );
  }
}
