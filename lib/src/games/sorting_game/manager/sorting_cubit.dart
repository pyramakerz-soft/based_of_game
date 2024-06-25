import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../src_model/export_models.dart';
import '../../../core/talk_tts.dart';

part 'sorting_state.dart';

class SortingCubit extends Cubit<SortingInitial> {
  SortingCubit({
    required List<GameFinalModel> listGameData,
    required String background,
    required int index,
  }) : super(SortingInitial(
            gameData: listGameData[index],
            woodenBackground: background,
            currentImages: [],
            index: index,
            correctAnswersData: [],
            correctAnswersIds: [],
            listGameData: listGameData,
            countOfQuestion: listGameData.fold(
                0,
                (previousValue, element) =>
                    previousValue + (element.gameImages?.length ?? 0)))) {
    emit(state.copyWith(
        cardsLetters: state.listGameData.first.gameLetters,
        correctAnswersIds: []));
    changeImages();
    TalkTts.startTalk(text: state.listGameData.first.inst ?? '');
  }

  changeImages() {
    List<GameImagesGameFinalModel> newList =
        (state.listGameData[state.index].gameImages ?? [])
            .where((element) =>
                state.correctAnswersIds.contains(element.id) == false)
            .toList();
    newList.shuffle();
    emit(state.copyWith(currentImages: newList));
  }

  addTheCorrectAnswer({required GameImagesGameFinalModel answer}) async {
    List<GameImagesGameFinalModel> correctAnswersData =
        state.correctAnswersData;
    List<int> correctAnswersIds = state.correctAnswersIds;
    correctAnswersData.add(answer);
    List<GameImagesGameFinalModel> newImagesList = state.currentImages;
    newImagesList.removeWhere((element) => element.id == answer.id);
    correctAnswersIds.add(answer.id ?? 0);
    emit(state.copyWith(
        correctAnswersData: correctAnswersData,
        currentImages: newImagesList,
        correctAnswersIds: correctAnswersIds));
  }

  clearAnswers() {
    emit(state.copyWith(correctAnswersIds: []));
  }

  updateTheCurrentGame({required int index}) {
    debugPrint('updateTheCurrentGame:${state.gameData.id}, $index');
    emit(state.copyWith(gameData: state.listGameData[index], index: index));
    debugPrint('updateTheCurrentGame:${state.gameData.id}');
  }

  bool checkIfIsTheLastQuestionOfGame() {
    if ((state.correctAnswersIds.length) ==
        (state.listGameData[state.index].gameImages?.length ?? 0)) {
      return true;
    } else {
      return false;
    }
  }
}
