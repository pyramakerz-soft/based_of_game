part of 'sorting_cups_cubit.dart';

class SortingCupsInitial extends Equatable {
  final GameModel gameData;
  final List<GameLettersModel>? cardsLetters;
  final List<int>? correctIndexes;
  final GameLettersModel? chooseWord;

  const SortingCupsInitial(
      {required this.gameData,
      this.cardsLetters,
      this.correctIndexes,
      this.chooseWord});
  SortingCupsInitial copyWith(
      {GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      List<String>? indexOfCorrectAnswers,
      List<int>? correctIndexes}) {
    return SortingCupsInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        chooseWord: chooseWord ?? this.chooseWord,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  @override
  List<Object?> get props =>
      [gameData, cardsLetters, chooseWord, correctIndexes];
}
