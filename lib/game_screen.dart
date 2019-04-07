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
  List<PlayingGame> games = [];
  PlayingGame game;
  String winOrLost;
  int player1Score = 0;
  int player2Score = 0;
  int drawScore = 0;

  void _startOnePersonGame(HandMove player) {
    game = new PlayingGame();
    int randomNumber = Random().nextInt(3);

    game.player1Move = player;
    game.player2Move = HandMove.values[randomNumber];

    winOrLost = game.outcomeInText();

    boardCounts(game.outcome());

    setState(() {
      games.add(game);
    });
  }

  void boardCounts(int outcome) {
    switch (outcome) {
      case 1:
        player1Score++;
        break;
      case 2:
        player2Score++;
        break;
      default:
        drawScore++;
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    game = new PlayingGame();
    game.player1Move = HandMove.rock;
    game.player2Move = HandMove.rock;
    winOrLost = "vs";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Lets Play'),
        backgroundColor: Colors.orange,
      ),
      body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            new Text(
              "Round  " + games.length.toString(),
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
                fontFamily: 'Roboto',
              ),
            ),
            new Row(children: <Widget>[
              Expanded(
                  child: Image.asset("images/" +
                      game.player1Move.toString().split('.').last +
                      ".png") //Text("$player1"),
                  ),
              Text(
                '$winOrLost',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Expanded(
                  child: Image.asset("images/" +
                      game.player2Move.toString().split('.').last +
                      ".png") //Text("$player2"),
                  )
            ]),
            new Row(children: <Widget>[
              Text("Won # $player1Score"),
              Text("Loss # $player2Score"),
              Text("Draw # $drawScore"),
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