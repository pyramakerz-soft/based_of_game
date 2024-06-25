part of 'drag_word_to_pic_cubit.dart';

@immutable
class DragWordToPicInitial extends Equatable {
  final GameFinalModel gameData;
  final List<GameImagesGameFinalModel>? gameImages;
  final List<GameImagesGameFinalModel>? gameImages2;
  final List<GameImagesGameFinalModel>? mainGameImages;
  final List<int> correctedAnswers;

  const DragWordToPicInitial(
      {required this.gameData,
      required this.correctedAnswers,
      this.mainGameImages,
       this.gameImages2,
       this.gameImages});

  DragWordToPicInitial copyWith(
      {GameFinalModel? gameData,
      List<GameImagesGameFinalModel>? gameImages2,
      List<GameImagesGameFinalModel>? mainGameImages,
      List<int>? correctedAnswers,
      List<GameImagesGameFinalModel>? gameImages}) {
    return DragWordToPicInitial(
        gameData: gameData ?? this.gameData,
        gameImages: gameImages ?? this.gameImages,
        gameImages2: gameImages2 ?? this.gameImages2,
        mainGameImages: mainGameImages ?? this.mainGameImages,
        correctedAnswers: correctedAnswers ?? this.correctedAnswers);
  }

  @override
  List<Object?> get props => [gameData,correctedAnswers,  gameImages,gameImages2, mainGameImages];
}
