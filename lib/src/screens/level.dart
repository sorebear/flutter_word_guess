import 'package:flutter/material.dart';

class Level extends StatefulWidget {
  final String levelName;
  final int levelNum;
  final String secretWord;

  Level(this.levelName, this.levelNum, this.secretWord);

  createState() {
    return _LevelState(levelName, levelNum, secretWord);
  }
}

class GuessObj {
  final String guess;
  final int correctLetterAndPos;
  final int correctLetter;

  String get printGuess => guess;
  String get printCorrectLetterAndPos => correctLetterAndPos.toString();
  String get printCorrectLetter => correctLetter.toString();

  GuessObj(this.guess, this.correctLetterAndPos, this.correctLetter);
}

class _LevelState extends State<Level> {
  String levelName;
  int levelNum;
  List<String> secretWord;
  List<String> lettersArr;

  List<String> guess = [];
  List<GuessObj> previousGuesses = []; 

  getAvailableLetters(word) {
    List<String> allLetters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    List<String> secretWordLetters = word.toUpperCase().split('');
    List<String> guessableLettersOption = [];
  
    for (int i = 0; i < secretWordLetters.length; i += 1) {
      String letter = secretWordLetters[i];
      allLetters.remove(letter);
      if (secretWordLetters.indexOf(letter) == i) {
        guessableLettersOption.add(letter);
      }
    }
    
    allLetters.shuffle();
    
    while (guessableLettersOption.length < 10) {
      String letter = allLetters.removeLast();
      guessableLettersOption.add(letter);
    }
    
    guessableLettersOption.shuffle();
    return guessableLettersOption;
  }

  mapListToWidgets(int subStart, int subEnd) {
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
                setState(() {
                  guess.add(lettersArr[i]);
                });
              }
            },
          ),
        ),
      );

      letterButtons.add(button);
    }
    
    return letterButtons.sublist(subStart, subEnd);
  }

  setDashes() {
    List<String> dashes = [];
    for (int i = guess.length; i < secretWord.length; i += 1) {
      dashes.add('-');
    }

    return dashes.join('');
  }

  evaluateGuess() {
    if (guess.join('') == secretWord.join('')) {
      print('YOU WIN!');
    }

    int correctLetterAndPos = 0;
    int correctLetter = 0;

    List<int> fallbackListGuess = [];
    List<int> fallbackListSecretWord = [];

    for (int i = 0; i < guess.length; i += 1) {
      if (guess[i] == secretWord[i]) {
        correctLetterAndPos += 1;
      } else {
        fallbackListGuess.add(i);
        fallbackListSecretWord.add(i);
      }
    }

    // Loop through all remaining letters of the guess
    for (int i = 0; i < fallbackListGuess.length; i += 1) {
      // For each letter remaining in the Guess see if it's in the Secret Word
      String letterToCheck = guess[fallbackListGuess[i]];
      int posOfMatchedLetter = secretWord.indexOf(letterToCheck);
      int posOfIndexInRemainingList = fallbackListSecretWord.indexOf(posOfMatchedLetter);
      if (posOfMatchedLetter != -1 && posOfIndexInRemainingList != -1) {
        correctLetter += 1;
        fallbackListSecretWord.remove(posOfIndexInRemainingList);
      }
    }
    
    print('GUESS: ' + guess.join(''));
    print('SECRET WORD: ' + secretWord.join(''));
    print('Correct Letters and Correct Position: ' + correctLetterAndPos.toString());
    print('Correct Letters but Wrong Position: ' + correctLetter.toString());
    print(previousGuesses);

    setState(() {
      previousGuesses.insert(0, new GuessObj(guess.join(''), correctLetterAndPos, correctLetter));
      guess.clear();
    });
  }

  _LevelState(String levelName, int levelNum, String secretWord) {
    this.levelName = levelName;
    this.levelNum = levelNum;
    this.secretWord = secretWord.toUpperCase().split('');
    this.lettersArr = getAvailableLetters(secretWord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${levelNum.toString()} | $levelName'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: Colors.pink,
                        width: 4.0,
                      )
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        guess.join('') + setDashes(),
                        style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: 'monospace'
                        )
                      ),
                    )
                  )
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverFixedExtentList(
                        itemExtent: 44.0,
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[50],
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(previousGuesses[index].printGuess),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),  
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.done_all),
                                        Text(previousGuesses[index].printCorrectLetterAndPos),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 8.0),  
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.done),
                                        Text(previousGuesses[index].printCorrectLetter)
                                      ],
                                    )
                                  )
                                ],
                              )
                            );
                          },
                          childCount: previousGuesses.length
                        ),
                      )
                    ],
                  )
                ),
              ],
            )
          ),
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
                      onPressed: () {
                        setState(() {
                          guess.removeLast();
                        });
                      },
                    ),
                  )
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                    child: RaisedButton(
                      child: Text('Clear'),
                      onPressed: () {
                        setState(() {
                          guess.clear();
                        });
                      }
                    )
                  )
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
            child: Row(
              children: mapListToWidgets(0, 5),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
            child: Row(
              children: mapListToWidgets(5, 10),
            )
          ),
          Container(
            height: 64.0,
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            // child: Expanded(
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontSize: 18.0,
                        )
                      ),
                    ),
                    Icon(Icons.send),
                  ]
                ),
                onPressed: () {
                  if (guess.length == secretWord.length) {
                    evaluateGuess();
                  }
                },
              )
            // )
          )
        ],
      )
    );
  }
}