part of 'dice_cubit.dart';

class DiceInitial extends Equatable {
  final GameFinalModel gameData;
  final String? chooseWord;
  final int? chooseWordId;
  final List<GameImagesGameFinalModel>? gameImages;

  final List<int> correctIndexes;
  final List<String>? letterDices;
  const DiceInitial(
      {required this.gameData,
      this.gameImages,
      this.chooseWordId,
      this.chooseWord,
      required this.correctIndexes,
      this.letterDices});
  DiceInitial copyWith({
    GameFinalModel? gameData,
    String? chooseWord,
    int? chooseWordId,
    List<GameImagesGameFinalModel>? gameImages,
    List<String>? letterDices,
    List<int>? correctIndexes,
  }) {
    return DiceInitial(
        gameData: gameData ?? this.gameData,
        chooseWord: chooseWord ?? this.chooseWord,
        chooseWordId: chooseWordId ?? this.chooseWordId,
        letterDices: letterDices ?? this.letterDices,
        gameImages: gameImages ?? this.gameImages,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  clearCurrentAnswer() {
    return DiceInitial(
        gameData: gameData,
        chooseWord: null,
        chooseWordId: null,
        letterDices: letterDices ?? letterDices,
        gameImages: gameImages ?? gameImages,
        correctIndexes: correctIndexes);
  }

  @override
  List<Object?> get props => [
        gameData,
        chooseWord,
        chooseWordId,
        gameImages,
        correctIndexes,
        letterDices
      ];
}
