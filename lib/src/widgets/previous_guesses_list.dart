import 'package:flutter/material.dart';
import '../models/guess.dart';

class PreviousGuessesList extends StatelessWidget {
  final List<Guess> _previousGuesses;

  @override
  PreviousGuessesList(this._previousGuesses);

  Widget showGuessWord(String guess) {
    return Container(
      padding: EdgeInsets.only(right: 8.0),
      child: Text(
        guess,
        style: TextStyle(
          fontFamily: 'NovaMono',
        ),
      ),
    );
  }

  Widget showSymoblsWithNumber(IconData icon, String number) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 20.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
            child: Text(number),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 44.0,
            delegate: SliverChildBuilderDelegate((BuildContext sliverContext, int index) {
              return Container(
                alignment: Alignment.center,
                color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[50],
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    showGuessWord(_previousGuesses[index].printGuess),
                    showSymoblsWithNumber(
                      Icons.spellcheck,
                      _previousGuesses[index].printCorrectLetterAndPos
                    ),
                    showSymoblsWithNumber(
                      Icons.done,
                      _previousGuesses[index].printCorrectLetter
                    ),
                  ],
                ),
              );
            },
            childCount: _previousGuesses.length),
            // childCount: _previousGuesses.length),
          ),
        ],
      ),
    );
  }
}
