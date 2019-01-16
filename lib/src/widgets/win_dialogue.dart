import 'package:flutter/material.dart';

import '../models/guess.dart';

class WinDialogue extends StatelessWidget {
  final List<Guess> _previousGuesses;
  final Function markLevelAsComplete;

  WinDialogue(this._previousGuesses, {this.markLevelAsComplete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'You Win!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          color: Color.fromARGB(255, 74, 175, 198),
        ),
      ),
      content: _previousGuesses.length == 0
          ? Text(
              'You found the secret word with only 1 guess!',
              textAlign: TextAlign.center,
            )
          : Text(
              'You found the secret word in ${(_previousGuesses.length + 1)} guesses.',
              textAlign: TextAlign.center,
            ),
      actions: <Widget>[
        RaisedButton(
          color: Color.fromARGB(255, 74, 175, 198),
          child: Text('Return To Menu',
              style: TextStyle(
                color: Colors.white,
              )),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
