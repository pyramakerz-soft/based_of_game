part of 'listen_choose_cubit.dart';

@immutable
class ListenChooseInitial extends Equatable {

  final List<GameFinalModel> listGameData;
  final GameFinalModel gameData;
  final int countCorrectAnswers;
  final List<GameLettersGameFinalModel> choose;
  final List<GameImagesGameFinalModel> images;
  final int index;
  final String? correctAnswer;
  final bool isCorrect;

  ListenChooseInitial(
      {required this.listGameData,
      required this.gameData,
      this.countCorrectAnswers =0,
      required this.choose,
      this.correctAnswer,
      this.isCorrect = false,
      required this.images,
      required this.index});

  ListenChooseInitial copyWith(
      {List<GameFinalModel>? listGameData,
        GameFinalModel? gameData,
        int? countCorrectAnswers,
        String? correctAnswer,
        bool? isCorrect,
        List<GameLettersGameFinalModel>? choose,
        List<GameImagesGameFinalModel>? images,
        int? index}) {
    return ListenChooseInitial(
        listGameData: listGameData ?? this.listGameData,
        gameData: gameData ?? this.gameData,
        isCorrect: isCorrect ?? this.isCorrect,
        countCorrectAnswers: countCorrectAnswers ?? this.countCorrectAnswers,
        choose: choose ?? this.choose,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        images: images ?? this.images,
        index: index ?? this.index);
  }

  @override
  List<Object?> get props => [correctAnswer,listGameData, gameData, countCorrectAnswers, choose, images, index];
}
