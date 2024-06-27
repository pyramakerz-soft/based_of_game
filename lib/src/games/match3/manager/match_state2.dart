part of 'match_cubit.dart';

@immutable
class MatchInitial2 extends Equatable {
  final List<GameFinalModel> listGameData;
  final GameFinalModel gameData;
  final int countCorrectAnswers;
  final List<GameImagesGameFinalModel> mainDataWillCheck;
  final List<GameImagesGameFinalModel> finalDataWillShow;
  final List<GlobalKey> widgetKey;
  final int index;
  final List<List<Offset?>> positions;

  MatchInitial2(
      {required this.listGameData,
      required this.gameData,
      this.countCorrectAnswers = 0,
      required this.mainDataWillCheck,
      required this.positions,
      required this.widgetKey,
      required this.finalDataWillShow,
      required this.index});

  MatchInitial2 copyWith(
      {List<GameFinalModel>? listGameData,
      GameFinalModel? gameData,
      List<String>? correctAnswers,
        List<List<Offset?>>? positions,
      int? countCorrectAnswers,
      List<GameImagesGameFinalModel>? mainDataWillCheck,
      List<GlobalKey>? widgetKey,
      List<GameImagesGameFinalModel>? finalDataWillShow,
      int? index}) {
    return MatchInitial2(
        listGameData: listGameData ?? this.listGameData,
        gameData: gameData ?? this.gameData,
        positions: positions ?? this.positions,
        widgetKey: widgetKey ?? this.widgetKey,
        countCorrectAnswers: countCorrectAnswers ?? this.countCorrectAnswers,
        mainDataWillCheck: mainDataWillCheck ?? this.mainDataWillCheck,
        finalDataWillShow: finalDataWillShow ?? this.finalDataWillShow,
        index: index ?? this.index);
  }

  @override
  List<Object?> get props => [
        listGameData,
        gameData,positions,
        index,widgetKey,
        mainDataWillCheck,
        finalDataWillShow,
        countCorrectAnswers
      ];
}
