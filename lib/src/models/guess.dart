class Guess {
  final String guess;
  final int correctLetterAndPos;
  final int correctLetter;

  String get printGuess => guess;
  String get printCorrectLetterAndPos => correctLetterAndPos.toString();
  String get printCorrectLetter => correctLetter.toString();

  Guess(this.guess, this.correctLetterAndPos, this.correctLetter);
}