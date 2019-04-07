import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'game_screen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp()
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
        navigateAfterSeconds: new GameScreen(),
        image: new Image.asset('images/logo.png'),
        backgroundColor: Colors.white30,
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}