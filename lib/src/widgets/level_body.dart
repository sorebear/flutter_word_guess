import 'package:flutter/material.dart';

import '../models/guess.dart';
import '../widgets/previous_guesses_list.dart';

class LevelBody extends StatelessWidget {
  final List<String> guess;
  final List<Guess> previousGuesses;
  final List<String> secretWord;

  LevelBody(this.previousGuesses, this.guess, this.secretWord);

  String _setDashes() {
    List<String> dashes = [];
    for (int i = guess.length; i < secretWord.length; i += 1) {
      dashes.add('-');
    }

    return dashes.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('images/patterns/morocco.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        child: Text(
                          guess.join('') + _setDashes(),
                          style: TextStyle(
                            fontSize: 40.0,
                            fontFamily: 'NovaMono',
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          PreviousGuessesList(previousGuesses),
        ],
      ),
    );
  }
}
