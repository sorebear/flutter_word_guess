import 'package:flutter/material.dart';

import '../blocs/levels_provider.dart';
import '../models/guess.dart';
import '../widgets/level_body.dart';
import '../widgets/keyboard.dart';
import '../widgets/win_dialogue.dart';

class Level extends StatefulWidget {
  final String levelName;
  final String levelNum;
  final String secretWord;

  Level(this.levelName, this.levelNum, this.secretWord);

  createState() {
    return _LevelState(levelName, levelNum, secretWord);
  }
}

class _LevelState extends State<Level> {
  final String levelName;
  final String levelNum;
  final List<String> guess = [];
  final List<Guess> _previousGuesses = [];
  
  List<String> secretWord;
  List<String> lettersArr;


  _LevelState(this.levelName, this.levelNum, String secretWord) {
    this.secretWord = secretWord.toUpperCase().split('');
    this.lettersArr = _getAvailableLetters(secretWord);
  }

  _getAvailableLetters(word) {
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

  void add(String letter) {
    setState(() => guess.add(letter));
  }

  void backspace() {
    if (guess.length > 0) {
      setState(() => guess.removeLast());
    }
  }

  void clear() {
    setState(() => guess.clear());
  }


  void _evaluateGuess(BuildContext context) {
    if (guess.join('') == secretWord.join('')) {
      
      
      _showWinDialogue();
      return;
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
        fallbackListSecretWord.remove(posOfMatchedLetter);
      }
    }

    setState(() {
      _previousGuesses.insert(0, new Guess(guess.join(''), correctLetterAndPos, correctLetter));
      guess.clear();
    });
  }

  Future<void> _showWinDialogue() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WinDialogue(_previousGuesses);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${int.parse(levelNum)} | $levelName'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            LevelBody(_previousGuesses,guess,secretWord),
            Keyboard(
              add: add,
              backspace: backspace,
              clear: clear,
              evaluateGuess: _evaluateGuess,
              lettersArr: lettersArr,
              secretWord: secretWord,
              guess: guess,
            ),
          ],
        ),
      ),
    );
  }
}