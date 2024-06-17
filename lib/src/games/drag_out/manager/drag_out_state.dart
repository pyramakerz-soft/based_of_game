part of 'drag_out_cubit.dart';

class DragOutInitial extends Equatable {
  final GameModel gameData;
  final List<GameModel> allGameData;
  final int? correctAnswer;
  final int index;

  const DragOutInitial({
    required this.gameData,
    this.correctAnswer,
    this.index = 0,
    required this.allGameData,
  });
  DragOutInitial copyWith({
    GameModel? gameData,
    List<GameModel>? allGameData,
    int? correctAnswer,
    int? index,
  }) {
    return DragOutInitial(
        gameData: gameData ?? this.gameData,
        index: index ?? this.index,
        allGameData: allGameData ?? this.allGameData,
        correctAnswer: correctAnswer ?? this.correctAnswer);
  }

  @override
  List<Object?> get props => [gameData, correctAnswer, index, allGameData];
}
