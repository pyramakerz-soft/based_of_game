part of 'tracing_cubit.dart';

class TracingInitial extends Equatable {
  final GameFinalModel gameData;
  final CurrentGamePhoneticsState stateOfGame;
  final List<Color?> colorsOfPaths;
  final List<Offset> paths;
  final Offset? currentPosition;
  final int? countOfPaths;

  const TracingInitial(
      {required this.gameData,
      required this.paths,
      required this.colorsOfPaths,
      this.countOfPaths,
      this.currentPosition,
      required this.stateOfGame});

  TracingInitial copyWith(
      {GameFinalModel? gameData,
      List<Color?>? colorsOfPaths,
      List<Offset>? paths,
      CurrentGamePhoneticsState? stateOfGame,
      Offset? currentPosition,
      int? countOfPaths}) {
    return TracingInitial(
      gameData: gameData ?? this.gameData,
      stateOfGame: stateOfGame ?? this.stateOfGame,
      paths: paths ?? this.paths,
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
      paths: paths,
      countOfPaths: countOfPaths,
    );
  }

  clearData() {
    return TracingInitial(
      gameData: gameData,
      countOfPaths: null,
      paths: paths,
      currentPosition: null,
      stateOfGame: stateOfGame,
      colorsOfPaths: [],
    );
  }

  @override
  List<Object?> get props => [
        gameData,
        colorsOfPaths,
        paths,
        currentPosition,
        countOfPaths,
        stateOfGame
      ];
}
