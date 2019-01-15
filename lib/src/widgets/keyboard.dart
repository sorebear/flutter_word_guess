import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final Function add;
  final Function backspace;
  final Function clear;
  final Function evaluateGuess;
  final List<String> guess;
  final List<String> lettersArr;
  final List<String> secretWord;

  Keyboard(
      {this.add,
      this.backspace,
      this.clear,
      this.evaluateGuess,
      this.guess,
      this.lettersArr,
      this.secretWord});

  void _showToast(BuildContext context, String toastMessage) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(toastMessage),
        action: SnackBarAction(
          label: 'DISMISS',
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }

  List<Widget> _mapListToWidgets(int subStart, int subEnd) {
    List<Widget> letterButtons = [];

    for (int i = 0; i < lettersArr.length; i += 1) {
      Widget button = Expanded(
        child: Container(
          margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(lettersArr[i]),
            ),
            onPressed: () {
              if (guess.length < secretWord.length) {
                add(lettersArr[i]);
              }
            },
          ),
        ),
      );

      letterButtons.add(button);
    }

    return letterButtons.sublist(subStart, subEnd);
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    if (lettersArr.length < 10) {
      return Text('');
    }

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                  child: RaisedButton(
                    child: Icon(Icons.backspace),
                    onPressed: backspace,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                  child: RaisedButton(
                    child: Text('Clear'),
                    onPressed: clear,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
          child: Row(
            children: _mapListToWidgets(0, 5),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
          child: Row(
            children: _mapListToWidgets(5, 10),
          ),
        ),
        Container(
          height: 64.0,
          padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
          child: RaisedButton(
            color: primaryColor,
            textColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Icon(Icons.send),
              ],
            ),
            onPressed: () {
              if (guess.length == secretWord.length) {
                evaluateGuess(context);
              } else {
                _showToast(
                  context,
                  'Your guess must be ${secretWord.length} letters',
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
