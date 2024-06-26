part of 'rearrange_cubit.dart';

@immutable
class RearrangeInitial extends Equatable {
  final List<GameFinalModel> listGameData;
  final GameFinalModel gameData;
  final List<String> correctAnswers;
  final List<String> userAnswers;
  final String finalAnswer;
  final int index;

  RearrangeInitial(
      {required this.listGameData,
      required this.gameData,
      required this.correctAnswers,
      required this.userAnswers,
      required this.finalAnswer,
      required this.index});

  RearrangeInitial copyWith(
      {List<GameFinalModel>? listGameData,
      GameFinalModel? gameData,
      List<String>? correctAnswers,
      List<String>? userAnswers,
        String? finalAnswer,
      int? index}) {
    return RearrangeInitial(
        listGameData: listGameData ?? this.listGameData,
        gameData: gameData ?? this.gameData,
        finalAnswer: finalAnswer ?? this.finalAnswer,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        userAnswers: userAnswers ?? this.userAnswers,
        index: index ?? this.index);
  }

  @override
  List<Object?> get props =>
      [listGameData, gameData, index, correctAnswers, finalAnswer,userAnswers];
}
