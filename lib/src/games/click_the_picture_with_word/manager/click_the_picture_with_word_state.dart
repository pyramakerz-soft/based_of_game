part of 'click_the_picture_with_word_cubit.dart';

class ClickThePictureWithWordInitial extends Equatable {
  final GameModel gameData;
  // final List<GameImagesModel>? gameDataPartOne;
  final List<GameImagesModel>? gameImages;
  final List<String> backGround;
  final List<int> correctIndexes;
  final GameImagesModel? chooseWord;
  // final int? correctAnswer;
  const ClickThePictureWithWordInitial(
      {required this.gameData,
      this.gameImages,
      required this.backGround,
      required this.correctIndexes,
      this.chooseWord});

  ClickThePictureWithWordInitial copyWith(
      {GameModel? gameData,
      List<String>? backGround,
      List<GameImagesModel>? gameImages,
      List<int>? correctIndexes,
      GameImagesModel? chooseWord}) {
    return ClickThePictureWithWordInitial(
        gameData: gameData ?? this.gameData,
        backGround: backGround ?? this.backGround,
        gameImages: gameImages ?? this.gameImages,
        chooseWord: chooseWord ?? this.chooseWord,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  ClickThePictureWithWordInitial clearChooseWord() {
    return ClickThePictureWithWordInitial(
        gameData: gameData,
        gameImages: gameImages,
        backGround: backGround,
        chooseWord: null,
        correctIndexes: correctIndexes);
  }

  @override
  List<Object?> get props => [
        chooseWord,
        correctIndexes,
        gameData,
        backGround,
        gameImages,
        // gameDataPartTwo,
        // gameDataPartOne
      ];
}
