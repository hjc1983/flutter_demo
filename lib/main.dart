import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'game_screen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new AfterSplash(),
        image: new Image.asset('images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Loading..."),
        loaderColor: Colors.red);
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Rock Paper Scissors"), automaticallyImplyLeading: false),
      body: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "Let the Game Begin!",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
          new RaisedButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GameScreen(title: "Let's Play...")),
                  ),
              child: new Text('Play')),
        ],
      )),
    );
  }
}
