part of 'match_cubit.dart';

@immutable
class MatchInitial extends Equatable {
  final List<GameFinalModel> listGameData;
  final GameFinalModel gameData;
  final int countCorrectAnswers;
  final List<GameLettersGameFinalModel> answers;
  final Offset? start;
  final Offset? end;
  final List<GameImagesGameFinalModel> imageAnswers;
  final int index;
  final List<GlobalKey> widgetKey;
  final List<List<Offset?>> positions;

  MatchInitial(
      {required this.listGameData,
      required this.gameData,
      this.countCorrectAnswers = 0,
      required this.answers,
      required this.widgetKey,
      required this.positions,
      this.start,
      this.end,
      required this.imageAnswers,
      required this.index});

  MatchInitial copyWith(
      {List<GameFinalModel>? listGameData,
      GameFinalModel? gameData,
      List<String>? correctAnswers,
      List<List<Offset?>>? positions,
      int? countCorrectAnswers,
      List<GlobalKey>? widgetKey,
      List<GameLettersGameFinalModel>? answers,
      List<GameImagesGameFinalModel>? imageAnswers,
      int? index}) {
    return MatchInitial(
        listGameData: listGameData ?? this.listGameData,
        gameData: gameData ?? this.gameData,
        positions: positions ?? this.positions,
        countCorrectAnswers: countCorrectAnswers ?? this.countCorrectAnswers,
        answers: answers ?? this.answers,
        widgetKey: widgetKey ?? this.widgetKey,
        imageAnswers: imageAnswers ?? this.imageAnswers,
        index: index ?? this.index);
  }

  @override
  List<Object?> get props => [
        listGameData,
        gameData,
        index,
        imageAnswers,
        widgetKey,
        answers,
        positions,
        countCorrectAnswers
      ];
}
