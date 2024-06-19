part of 'bingo_cubit.dart';

@immutable
class BingoInitial extends Equatable {
  final List<GameLettersModel>? cardsLetters;
  final GameModel gameData;
  final List<int> correctIndexes;
  final GameLettersModel? chooseWord;

  const BingoInitial(
      {required this.gameData,
      required this.correctIndexes,
      this.cardsLetters,
      this.chooseWord});

  BingoInitial copyWith(
      {GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      List<String>? indexOfCorrectAnswers,
      List<int>? correctIndexes}) {
    return BingoInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        chooseWord: chooseWord ?? this.chooseWord,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  BingoInitial clearAllData() {
    return BingoInitial(gameData: gameData, correctIndexes: []);
  }

  @override
  List<Object?> get props => [
        gameData,
        correctIndexes,
        cardsLetters,
        chooseWord,
      ];
}
