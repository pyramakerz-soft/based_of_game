part of 'click_picture_cubit.dart';

// @immutable
// abstract class DragOutState {}

class ClickPictureInitial extends Equatable {
  final GameFinalModel gameData;
  final List<String> backGround;
  final List<int> correctIndexes;
  final bool isArabic;
  final List<GameImagesGameFinalModel>? gameImages;
  const ClickPictureInitial(
      {required this.gameData,
      required this.backGround,
      required this.correctIndexes,
      this.gameImages,
      required this.isArabic});

  ClickPictureInitial copyWith(
      {GameFinalModel? gameData,
      List<String>? backGround,
      List<int>? correctIndexes,
      List<GameImagesGameFinalModel>? gameImages,
      DateTime? currentPressTime,
      bool? isArabic}) {
    return ClickPictureInitial(
      gameData: gameData ?? this.gameData,
      backGround: backGround ?? this.backGround,
      gameImages: gameImages ?? this.gameImages,
      correctIndexes: correctIndexes ?? this.correctIndexes,
      isArabic: isArabic ?? this.isArabic,
    );
  }

  @override
  List<Object?> get props => [gameData, correctIndexes, isArabic, gameImages];
}
