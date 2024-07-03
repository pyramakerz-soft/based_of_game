part of 'drag_out_cubit.dart';

class DragOutInitial extends Equatable {
  final GameFinalModel gameData;
  final List<GameFinalModel> allGameData;
  final int? correctAnswer;
  final List<GameImagesGameFinalModel>? gameImages;
  final int index;

  const DragOutInitial({
    required this.gameData,
    this.correctAnswer,
    this.gameImages,
    this.index = 0,
    required this.allGameData,
  });
  DragOutInitial copyWith({
    GameFinalModel? gameData,
    List<GameFinalModel>? allGameData,
    List<GameImagesGameFinalModel>? gameImages,
    int? correctAnswer,
    int? index,
  }) {
    return DragOutInitial(
        gameData: gameData ?? this.gameData,
        index: index ?? this.index,
        gameImages: gameImages ?? this.gameImages,

        allGameData: allGameData ?? this.allGameData,
        correctAnswer: correctAnswer ?? this.correctAnswer);
  }

  @override
  List<Object?> get props => [gameData, gameImages,correctAnswer, index, allGameData];
}
