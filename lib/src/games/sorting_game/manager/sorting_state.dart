part of 'sorting_cubit.dart';

@immutable
class SortingInitial extends Equatable {
  final List<GameModel> listGameData;
  final GameModel gameData;
  final List<int> correctAnswersIds;
  final String? woodenBackground;
  final int index;
  final int countOfQuestion;
  final List<GameImagesModel> currentImages;
  final List<GameImagesModel> correctAnswersData;

  const SortingInitial({
    required this.listGameData,
    required this.correctAnswersIds,
    required this.gameData,
    required this.currentImages,
    required this.countOfQuestion,
    required this.correctAnswersData,
    this.woodenBackground,
    required this.index,
  });

  SortingInitial copyWith(
      {List<GameModel>? listGameData,
      GameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      GameLettersModel? chooseWord,
      List<String>? indexOfCorrectAnswers,
      List<int>? correctAnswersIds,
      List<GameImagesModel>? currentImages,
      List<GameImagesModel>? correctAnswersData,
      int? index,
      int? countOfQuestion,
      String? woodenBackground}) {
    return SortingInitial(
        listGameData: listGameData ?? this.listGameData,
        countOfQuestion: countOfQuestion ?? this.countOfQuestion,
        correctAnswersIds: correctAnswersIds ?? this.correctAnswersIds,
        gameData: gameData ?? this.gameData,
        woodenBackground: woodenBackground ?? this.woodenBackground,
        currentImages: currentImages ?? this.currentImages,
        index: index ?? this.index,
        correctAnswersData: correctAnswersData ?? this.correctAnswersData);
  }

  @override
  List<Object?> get props => [
        listGameData,
        correctAnswersIds,
        woodenBackground,
        index,
        countOfQuestion,
        currentImages,
        gameData,
        correctAnswersData
      ];
}
