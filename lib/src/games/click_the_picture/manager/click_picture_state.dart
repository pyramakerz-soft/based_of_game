part of 'click_picture_cubit.dart';

// @immutable
// abstract class DragOutState {}

class ClickPictureInitial extends Equatable {
  final GameModel gameData;
  final List<String> backGround;
  final List<int> correctIndexes;
  final bool isArabic;
  final List<GameImagesModel>? gameImages;
  const ClickPictureInitial(
      {required this.gameData,
      required this.backGround,
      required this.correctIndexes,
      this.gameImages,
      required this.isArabic});

  ClickPictureInitial copyWith(
      {GameModel? gameData,
      List<String>? backGround,
      List<int>? correctIndexes,
      List<GameImagesModel>? gameImages,
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
