import 'package:flutter/material.dart';
import './screens/home.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Guess',
      theme: ThemeData(
        fontFamily: 'NovaMono',
        primaryColor: Color.fromARGB(255, 74, 175, 198),
      ),
      home: Home(),
    );
  }
}