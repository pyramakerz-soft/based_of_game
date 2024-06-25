part of 'drag_pic_to_word_cubit.dart';

@immutable
class DragPicToWordInitial extends Equatable {
  final GameFinalModel gameData;
  final List<GameImagesGameFinalModel> gameImages;
  final List<int> correctedAnswers;

  const DragPicToWordInitial(
      {required this.gameData,
      required this.correctedAnswers,
      required this.gameImages});

  DragPicToWordInitial copyWith(
      {GameFinalModel? gameData,
      List<GameImagesGameFinalModel>? gameLetters,
      List<int>? correctedAnswers,
      List<GameImagesGameFinalModel>? gameImages}) {
    return DragPicToWordInitial(
        gameData: gameData ?? this.gameData,
        gameImages: gameImages ?? this.gameImages,
        correctedAnswers: correctedAnswers ?? this.correctedAnswers);
  }

  @override
  List<Object?> get props => [gameData,correctedAnswers,  gameImages];
}
