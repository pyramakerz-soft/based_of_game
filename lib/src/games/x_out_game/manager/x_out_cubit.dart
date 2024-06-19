import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:games_models/games_models.dart';

import '../../../core/assets_sound_letters.dart';
import '../../../core/audio_player_letters.dart';
import '../../../core/talk_tts.dart';
part 'x_out_state.dart';

class XOutCubit extends Cubit<XOutInitial> {
  XOutCubit({required List<GameModel> listGameData, required int index})
      : super(XOutInitial(
            listGameData:
                listGameData.where((element) => element.isEdited == 0).toList(),
            currentGameIndex: index)) {
    emit(state.copyWith(gameData: state.listGameData[index]));
    startSayGame();
  }

  Future<void> selectItem(int index) async {
    final selectedItems = state.selectedItems ?? [];

    if (!selectedItems.contains(index)) {
      final updatedSelectedItems = List<int>.from(selectedItems)..add(index);

      emit(state.copyWith(
        selectedItems: updatedSelectedItems,
      ));
    }
  }

  updateTheCurrentGame({required int index}) async {
    await Future.delayed(const Duration(seconds: 2));

    emit(state.clearCurrentCorrectAnswers());
    emit(state.copyWith(
        gameData: state.listGameData[index], currentGameIndex: index));
    sayTheLetter();
  }

  startSayGame() async {
    await TalkTts.startTalk(text: state.gameData?.inst ?? '');
    await AudioPlayerLetters.startPlaySound(
        soundPath: AssetsSoundLetters.getSoundOfLetter(
            mainGameLetter: (state.gameData?.mainLetter ?? '')));
  }

  sayTheLetter() async {
    await AudioPlayerLetters.startPlaySound(
        soundPath: AssetsSoundLetters.getSoundOfLetter(
            mainGameLetter: (state.gameData?.mainLetter ?? '')));
  }
}
