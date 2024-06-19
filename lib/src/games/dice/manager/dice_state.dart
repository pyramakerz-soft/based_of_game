part of 'dice_cubit.dart';

class DiceInitial extends Equatable {
  final GameModel gameData;
  final String? chooseWord;
  final List<GameImagesModel>? gameImages;

  final List<int> correctIndexes;
  final List<String>? letterDices;
  const DiceInitial(
      {required this.gameData,
      this.gameImages,
      this.chooseWord,
      required this.correctIndexes,
      this.letterDices});
  DiceInitial copyWith({
    GameModel? gameData,
    String? chooseWord,
    List<GameImagesModel>? gameImages,
    List<String>? letterDices,
    List<int>? correctIndexes,
  }) {
    return DiceInitial(
        gameData: gameData ?? this.gameData,
        chooseWord: chooseWord ?? this.chooseWord,
        letterDices: letterDices ?? this.letterDices,
        gameImages: gameImages ?? this.gameImages,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  clearCurrentAnswer() {
    return DiceInitial(
        gameData: gameData,
        chooseWord: null,
        letterDices: letterDices ?? letterDices,
        gameImages: gameImages ?? gameImages,
        correctIndexes: correctIndexes);
  }

  @override
  List<Object?> get props =>
      [gameData, chooseWord, gameImages, correctIndexes, letterDices];
}
