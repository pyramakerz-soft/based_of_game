import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_models/games_models.dart';

import '../../../../based_of_game.dart';
import '../../../core/audio_player_letters.dart';
import '../../../core/talk_tts.dart';
part 'click_picture_state.dart';

class ClickPictureCubit extends Cubit<ClickPictureInitial> {
  ClickPictureCubit(
      {required GameModel gameData,
      required List<String> background,
      required bool isArabic})
      : super(ClickPictureInitial(
            gameData: gameData,
            backGround: background,
            isArabic: isArabic,
            correctIndexes: [])) {
    generateRandomPictures();
    startInstruction();
  }

  bool addAnswer(int index) {
    List<int> correctIndexes = state.correctIndexes;
    if (state.gameImages?[index].correct == 1) {
      // emit(state);
      correctIndexes.add(index);
      emit(state.copyWith(correctIndexes: correctIndexes.toSet().toList()));
      return true;
    } else {
      return false;
    }
  }

  Future<void> generateRandomPictures() async {
    List<GameImagesModel> gameImages = (state.gameData.gameImages ?? [])
      ..shuffle();
    emit(state.copyWith(gameImages: gameImages));
  }

  startInstruction() async {
    await TalkTts.startTalk(
        text: state.gameData.inst ?? '', isArabic: state.isArabic);
    await AudioPlayerLetters.startPlaySound(
        soundPath: AssetsSoundLetters.getSoundOfLetter(
            mainGameLetter: state.gameData.mainLetter ?? ''));
  }

  sayTheLetter() async {
    await AudioPlayerLetters.startPlaySound(
        soundPath: AssetsSoundLetters.getSoundOfLetter(
            mainGameLetter: state.gameData.mainLetter ?? ''));
  }
}
