import 'package:flutter/material.dart';
import './screens/home.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Word Guess',
        home: Home(),
      );
    }
}