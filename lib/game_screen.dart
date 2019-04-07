import 'package:flutter/material.dart';
import 'game.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Game> gms = [];
  Game g;
  String winOrLost;
  int p1Score=0, p2Score=0, drawScore=0, rdn = 0;

  void startGame(Ico player) {
    g = new Game();
    rdn = Random().nextInt(3);
    g.p1Move = player;
    g.p2Move = Ico.values[rdn];
    int outcome = g.outcome();
    winOrLost = outcome == 1 ? ('You Won') : outcome == 2 ? ('Loss') : "Draw";
    outcome == 1 ? p1Score++ : outcome == 2 ? p2Score++ : drawScore++;

    setState(() {
      gms.add(g);
    });
  }
  
  @override
  void initState() {
    super.initState();
    g = new Game();
    g.p1Move = Ico.man;
    g.p2Move = Ico.app;
    winOrLost = "vs";
  }

void reset(){
  setState(() {
    gms = [];
    g.p1Move = Ico.man;
    g.p2Move = Ico.app;
    winOrLost = "vs";
    p1Score=0; p2Score=0; drawScore=0; rdn=0;
  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Rock Paper Scissors')),
      body: new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        new Text(
          '${gms.length==0?'':'Round ${gms.length}'}',
          style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 60.0),
        ),
        new Row(children: <Widget>[
          Expanded(child: Image.asset("images/${g.p1Move.toString().split('.').last}.png", scale: 2)),
          Text(
            '$winOrLost',
            style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),
          ),
          Expanded(child: Image.asset("images/${g.p2Move.toString().split('.').last}.png", scale: 2)),
        ]),
        new Text("Won: $p1Score, Loss: $p2Score, Draw: $drawScore"),
        new  GestureDetector(
          child: Text("RESET"), onTap: () {reset();}
        ),
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: ()=> startGame(Ico.rock),
              child: Image.asset('images/r.png', scale: 1.3, color: Colors.orange),
            ),
            GestureDetector(
              onTap: () => startGame(Ico.paper),
              child: Image.asset('images/p.png', scale: 1.2, color: Colors.orange),
            ),
            GestureDetector(
              onTap: ()=> startGame(Ico.scissors),
              child: Image.asset('images/s.png', scale: 1.4, color: Colors.orange),
            )
          ]
        )
      ])),
    );
  }
}