part of 'click_the_word_cubit.dart';

@immutable
class ClickTheWordInitial extends Equatable {
  final int index;
  final List<GameFinalModel> listGameData;
  final GameFinalModel gameData;
  final List<int> listCorrectAnswers;
  final int? countQuestion;
  final int? wrongAnswer;
  final String? headOfQuestion;

  final List<GameLettersGameFinalModel>? choose;

  ClickTheWordInitial(
      {required this.index,
      required this.listGameData,
      required this.gameData,
      required this.listCorrectAnswers,
      this.countQuestion,
      this.wrongAnswer,
      this.headOfQuestion,
      this.choose});

  ClickTheWordInitial copyWith(
      {List<GameFinalModel>? listGameData,
        GameFinalModel? gameData,
        List<int>? listCorrectAnswers,
        int? countQuestion,
        int? wrongAnswer,
        String? headOfQuestion,
        List<GameLettersGameFinalModel>? choose,
        int? index}) {
    return ClickTheWordInitial(
        listGameData: listGameData ?? this.listGameData,
        gameData: gameData ?? this.gameData,
        listCorrectAnswers: listCorrectAnswers ?? this.listCorrectAnswers,
        countQuestion: countQuestion ?? this.countQuestion,
        wrongAnswer: wrongAnswer ?? this.wrongAnswer,
        choose: choose ?? this.choose,
        headOfQuestion: headOfQuestion ?? this.headOfQuestion,
        index: index ?? this.index);
  }


  ClickTheWordInitial clearWrongAnswer() {
    return ClickTheWordInitial(
        listGameData: listGameData,
        gameData: gameData,
        listCorrectAnswers: listCorrectAnswers,
        countQuestion: countQuestion ,
        wrongAnswer: null,
        choose: choose ,
        headOfQuestion: headOfQuestion,
        index: index);
  }

  @override
  List<Object?> get props => [wrongAnswer,index, listGameData, gameData, listCorrectAnswers, countQuestion, choose];
}
