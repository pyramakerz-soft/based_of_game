part of 'match_cubit.dart';

@immutable
class MatchInitial extends Equatable {
  final List<GameFinalModel> listGameData;
  final GameFinalModel gameData;
  final int countCorrectAnswers;
  final List<GameLettersGameFinalModel> answers;
  final List<GameImagesGameFinalModel> imageAnswers;
  final int index;

  MatchInitial(
      {required this.listGameData,
      required this.gameData,
      this.countCorrectAnswers = 0,
      required this.answers,
      required this.imageAnswers,
      required this.index});

  MatchInitial copyWith(
      {List<GameFinalModel>? listGameData,
      GameFinalModel? gameData,
      List<String>? correctAnswers,
      int? countCorrectAnswers,
      List<GameLettersGameFinalModel>? answers,
      List<GameImagesGameFinalModel>? imageAnswers,
      int? index}) {
    return MatchInitial(
        listGameData: listGameData ?? this.listGameData,
        gameData: gameData ?? this.gameData,
        countCorrectAnswers: countCorrectAnswers ?? this.countCorrectAnswers,
        answers: answers ?? this.answers,
        imageAnswers: imageAnswers ?? this.imageAnswers,
        index: index ?? this.index);
  }

  @override
  List<Object?> get props => [
        listGameData,
        gameData,
        index,
        imageAnswers,
        answers,
        countCorrectAnswers
      ];
}
