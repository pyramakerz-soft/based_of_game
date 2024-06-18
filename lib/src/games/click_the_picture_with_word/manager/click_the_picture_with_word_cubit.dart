import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_models/games_models.dart';

import '../../../core/assets_sound_letters.dart';
import '../../../core/audio_player_letters.dart';
import '../../../core/talk_tts.dart';
part 'click_the_picture_with_word_state.dart';

class ClickThePictureWithWordCubit
    extends Cubit<ClickThePictureWithWordInitial> {
  ClickThePictureWithWordCubit(
      {required GameModel gameData, required List<String> backGround})
      : super(ClickThePictureWithWordInitial(
            gameData: gameData, backGround: backGround, correctIndexes: [])) {
    startGame();
    emit(state.copyWith(gameImages: gameData.gameImages));
  }

  startGame() async {
    await TalkTts.startTalk(text: state.gameData.inst ?? '');
    await getTheRandomWord();
  }

  getTheRandomWord() async {
    // if () {
    List<GameImagesModel> checkImages = state.gameImages
            ?.where(
                (element) => state.correctIndexes.contains(element.id) == false)
            .toList() ??
        [];
    // state.gameData.gameImages?.forEach((element) {
    //   if ( == false) {
    //     checkImages.add(element);
    //   }
    // });
    int countOfTheImage = checkImages.length;
    print('countOfTheImage:$countOfTheImage, ${state.chooseWord}');
    if (countOfTheImage != 0 && state.chooseWord == null) {
      Random random = Random();
      int randomNumber = random.nextInt(countOfTheImage);
      GameImagesModel chooseWord = checkImages[randomNumber];
      print('chooseWord.word ?? ' ':${chooseWord.word ?? ''}');
      await TalkTts.startTalk(text: chooseWord.word ?? '');
      emit(state.copyWith(chooseWord: chooseWord));
    }
    // }
  }

  addTheCorrectAnswer({required int idOfUserAnswer}) async {
    print('addTheCorrectAnswer');
    emit(state.clearChooseWord());

    List<int> correctAnswer = state.correctIndexes;
    correctAnswer.add(idOfUserAnswer);
    emit(state.copyWith(correctIndexes: correctAnswer));
    print(state.chooseWord);
    // getTheRandomWord();
  }

  sayTheLetter() async {
    await TalkTts.startTalk(text: state.chooseWord?.word ?? '');
  }

  // submitCorrectTheAnswer() async {
  //   int sub = state.correctAnswer ?? 0;
  //   sub = sub + 1;
  //   emit(state.copyWith(correctAnswer: sub));
  // }

  // submitWrongTheAnswer(
  //     {required Function() wrongAnimation,
  //     required Function() reStateOfAvatar}) {
  //   wrongAnimation();
  //   reStateOfAvatar();
  // }

  // sayTheCorrectAnswer() async {
  //   print('sayTheCorrectAnswer:${state.chooseWord?.word}');
  //   await TalkTts.startTalk(text: state.chooseWord?.word ?? '');
  // }
}
