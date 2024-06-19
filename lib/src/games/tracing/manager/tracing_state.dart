part of 'tracing_cubit.dart';

class TracingInitial extends Equatable {
  final GameModel gameData;
  final CurrentGamePhoneticsState stateOfGame;
  final List<Color?> colorsOfPaths;
  final Offset? currentPosition;
  final int? countOfPaths;

  const TracingInitial(
      {required this.gameData,
      required this.colorsOfPaths,
      this.countOfPaths,
      this.currentPosition,
      required this.stateOfGame});

  TracingInitial copyWith(
      {GameModel? gameData,
      List<Color?>? colorsOfPaths,
      CurrentGamePhoneticsState? stateOfGame,
      Offset? currentPosition,
      int? countOfPaths}) {
    return TracingInitial(
      gameData: gameData ?? this.gameData,
      stateOfGame: stateOfGame ?? this.stateOfGame,
      colorsOfPaths: colorsOfPaths ?? this.colorsOfPaths,
      currentPosition: currentPosition ?? this.currentPosition,
      countOfPaths: countOfPaths ?? this.countOfPaths,
    );
  }

  clearPosition() {
    return TracingInitial(
      gameData: gameData,
      stateOfGame: stateOfGame,
      colorsOfPaths: colorsOfPaths,
      currentPosition: null,
      countOfPaths: countOfPaths,
    );
  }

  clearData() {
    return TracingInitial(
      gameData: gameData,
      countOfPaths: null,
      currentPosition: null,
      stateOfGame: stateOfGame,
      colorsOfPaths: [],
    );
  }

  @override
  List<Object?> get props =>
      [gameData, colorsOfPaths, currentPosition, countOfPaths, stateOfGame];
}
