import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../src_model/export_models.dart';
import '../../../core/talk_tts.dart';

part 'match_state.dart';

class MatchCubit extends Cubit<MatchInitial> {
  MatchCubit({
    required List<GameFinalModel> listGameData,
    required int index,
  }) : super(MatchInitial(
          gameData: listGameData[index],
          index: index,
          listGameData: listGameData,
          answers: [],
          imageAnswers: [],
        )) {
    reFormatAnswers();
  }

  reFormatAnswers() {
    GameFinalModel data = state.gameData;
    List<GameLettersGameFinalModel> answers = data.gameLetters ?? [];
    List<GameImagesGameFinalModel> imageAnswers = data.gameImages ?? [];
    answers.shuffle();
    imageAnswers.shuffle();
    emit(state.copyWith(imageAnswers: imageAnswers, answers: answers));
  }


  addCorrectAnswer() {
    int countOfCorrect = state.countCorrectAnswers;
    countOfCorrect++;
    emit(state.copyWith(countCorrectAnswers: countOfCorrect));
  }

  updateTheCurrentGame({required int index}) {
    debugPrint('updateTheCurrentGame:${state.gameData.id}, $index');
    emit(state.copyWith(gameData: state.listGameData[index], index: index));
    debugPrint('updateTheCurrentGame:${state.gameData.id}');
    reFormatAnswers();
  }

}
