import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:games_models/games_models.dart';

import '../../../../based_of_game.dart';
import '../../../core/audio_player_letters.dart';
import '../../../core/talk_tts.dart';

part 'click_the_sound_state.dart';

class ClickTheSoundCubit extends Cubit<ClickTheSoundInitial> {
  final GameModel _gameData;

  ClickTheSoundCubit({
    required GameModel gameData,
  })  : _gameData = gameData,
        super(ClickTheSoundInitial(gameData: gameData, correctIndexes: [])) {
    generateRandomLetters();
    TalkTts.startTalk(text: _gameData.inst ?? '').whenComplete(() {
      sayTheLetter();
    });
  }

  sayTheLetter() async {
    await AudioPlayerLetters.startPlaySound(
        soundPath: AssetsSoundLetters.getSoundOfLetter(
            mainGameLetter: state.gameData.mainLetter ?? ''));
  }

  Future<void> generateRandomLetters() async {
    List<String> gameLetters =
        state.gameData.gameLetters?.map((e) => e.letter.toString()).toList() ??
            [];
    gameLetters.shuffle();
    emit(state.copyWith(letters: gameLetters));
  }

  Future<void> incrementCorrectAnswerCount(int index) async {
    List<int> correctIndexes = state.correctIndexes ?? [];
    correctIndexes.add(index);
    emit(state.copyWith(correctIndexes: correctIndexes));
  }
}
