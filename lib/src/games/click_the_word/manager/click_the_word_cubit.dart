import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../src_model/export_models.dart';
import '../../../core/talk_tts.dart';

part 'click_the_word_state.dart';

class ClickTheWordCubit extends Cubit<ClickTheWordInitial> {
  ClickTheWordCubit({
    required List<GameFinalModel> listGameData,
    required int index,
  }) : super(ClickTheWordInitial(
            index: index,
            listCorrectAnswers: [],
            listGameData: listGameData,
            gameData: listGameData[index])) {
    reFormatData();
  }

  reFormatData() {
    GameFinalModel data = state.gameData;
    int countQuestion = state.listGameData.fold(
        0,
        (sum, obj) =>
            sum +
            (obj.gameLetters
                    ?.where((element) => element.letter == obj.correctAns)
                    .length ??
                0));
    String headOfQuestion = data.correctAns ?? '';
    List<GameLettersGameFinalModel> choose = data.gameLetters ?? [];
    emit(state.copyWith(
        choose: choose,
        headOfQuestion: headOfQuestion,
        countQuestion: countQuestion));
    _sayLetter();
  }

  addAnswer({required int answerId}) {
    List<int> listCorrectAnswers = state.listCorrectAnswers;
    listCorrectAnswers.add(answerId);
    emit(state.copyWith(listCorrectAnswers: listCorrectAnswers));
    return _isLastQuestionInGame();
  }

  bool _isLastQuestionInGame() {
    List<int> listCorrectAnswers = state.listCorrectAnswers;
    int countOfQuestion = 0;
    List<GameFinalModel> listGameData2 =
        state.listGameData.sublist(0, (state.index + 1));
    listGameData2.forEach((element) {
      int countOfQuestionSubGame = element.gameLetters
              ?.where((element2) => element2.letter == element.correctAns)
              .length ??
          0;
      countOfQuestion = countOfQuestion + countOfQuestionSubGame;
    });

    if (countOfQuestion == listCorrectAnswers.length) {
      print(
          'countOfQuestionSubGame:$countOfQuestion, ${listCorrectAnswers.length}');

      return true;
    } else {
      return false;
    }
  }

  updateTheCurrentGame({required int index}) {
    debugPrint('updateTheCurrentGame:${state.gameData.id}, $index');
    emit(state.copyWith(gameData: state.listGameData[index], index: index));
    debugPrint('updateTheCurrentGame:${state.gameData.id}');
    reFormatData();
  }

  _sayLetter() async {
    await TalkTts.startTalk(
        text: "${state.gameData.inst} ${state.gameData.correctAns}");
  }

  addWrongAnswer({required int answerId}) async {
    emit(state.copyWith(wrongAnswer: answerId));
    await Future.delayed(Duration(seconds: 1));
    emit(state.clearWrongAnswer());
  }
}
