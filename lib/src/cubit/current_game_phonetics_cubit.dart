import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../based_of_eng_game.dart';
import '../core/assets_game_sound.dart';
import '../core/audio_player_game.dart';

part 'current_game_phonetics_state.dart';

class CurrentGamePhoneticsCubit extends Cubit<CurrentGamePhoneticsState> {
  CurrentGamePhoneticsCubit(
      {required MainDataOfChapters basicData,
      required void Function(int) actionOfCompleteGame,
      required List<GameFinalModel> gameData})
      : super(CurrentGamePhoneticsState(
            index: 0, actionWhenTriesBeZero: actionOfCompleteGame)) {
    _checkDataOfCubit();
    updateDataOfCurrentGame(
        basicData: basicData, gameData: gameData, gameIndex: 0);
    _getTheBackGround();
    _getTheBackGroundSuccess();
    _getTheBackGroundSad();
  }
  _checkDataOfCubit() {
    if (state.index > (state.gameData?.length ?? 0)) {
      return Exception("check the game data");
    }
  }

  _getTheBackGround() {
    rootBundle.load(state.basicData?.idelAvatar ?? '').then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(avatarArtboardIdle: artboard));
          emit(state.copyWith(avatarCurrentArtboard: state.avatarArtboardIdle));
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

  _getTheBackGroundSuccess() {
    rootBundle.load(state.basicData?.winAvatar ?? '').then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(avatarArtboardSuccess: artboard));
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

  _getTheBackGroundSad() {
    rootBundle.load(state.basicData?.sadAvatar ?? '').then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(avatarArtboardSad: artboard));
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

  saveTheStringWillSay(
      {required bool stateOfStringIsWord,
      required String stateOfStringWillSay}) {
    emit(state.copyWith(
        stateOfStringIsWord: stateOfStringIsWord,
        stateOfStringWillSay: stateOfStringWillSay));
  }

  updateIndexOfCurrentGame() async {
    int currentIndex = state.index;
    currentIndex = currentIndex + 1;
    emit(state.copyWith(index: currentIndex));
  }

  updateDataOfCurrentGame(
      {required MainDataOfChapters basicData,
      required List<GameFinalModel> gameData,
      required int gameIndex}) async {
    emit(state.clearAllData());
    emit(state.copyWith(
        basicData: basicData,
        currentAvatar: basicData.basicAvatar,
        index: gameIndex,
        gameData: gameData));
    _getTheBackGround();
    _getTheBackGroundSuccess();
    _getTheBackGroundSad();
    _saveCountOfTries();
  }

  _saveCountOfTries() {
    int countOfTries = state.gameData?[state.index].numOfTrials ?? 0;
    emit(state.copyWith(countOfTries: countOfTries, countOfStar: 0));
  }

  decreaseCountOfTries() {
    int countOfTries = (state.countOfTries ?? 1) - 1;
    emit(state.copyWith(countOfTries: countOfTries));
    debugPrint('state.countOfTries:${state.countOfTries}');
    if (state.countOfTries == 0) {
      state.actionWhenTriesBeZero(state.countOfStar ?? 0);
    }
  }

  bool checkIfIsTheLastQuestionOfGame({required int queations}) {
    int countOfCorrectAnswers = state.countOfCorrectAnswers;
    debugPrint('countOfCorrectAnswers:$countOfCorrectAnswers , $queations');
    if (queations <= countOfCorrectAnswers) {
      return true;
    } else {
      return false;
    }
  }

  getStateOfStars({required int mainCountOfQuestion}) {
    List<int> stateOfStarsAdd =
        BaseOfGames.getTheStarsAddState(mainCountOfQuestion);
    emit(state.copyWith(statesOfAddStars: stateOfStarsAdd));
  }

  addStarToStudent({required int stateOfCountOfCorrectAnswer}) {
    List<int> stateOfStarsAdd = state.statesOfAddStars ?? [];
    int mainCountOfQuestion = stateOfStarsAdd.fold(
        0, (previousValue, element) => previousValue + element);
    emit(state.copyWith(countOfCorrectAnswers: stateOfCountOfCorrectAnswer));
    debugPrint(
        'stateOfCountOfCorrectAnswer:$stateOfCountOfCorrectAnswer, $stateOfStarsAdd');
    if ((mainCountOfQuestion) > 2) {
      if (stateOfStarsAdd[0] <= stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: 1));
      } else {
        emit(state.copyWith(countOfStar: (0)));
      }
      if ((stateOfStarsAdd[1] + stateOfStarsAdd[0]) <=
          stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: 2));
      }
      if ((stateOfStarsAdd[2] + stateOfStarsAdd[0] + stateOfStarsAdd[1]) <=
          stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: 3));
      }
    } else {
      if (mainCountOfQuestion == 1) {
        emit(state.copyWith(countOfStar: 3));
      } else if (mainCountOfQuestion == 2) {
        if (stateOfCountOfCorrectAnswer == 1) {
          emit(state.copyWith(countOfStar: 1));
        } else if (stateOfCountOfCorrectAnswer == 2) {
          emit(state.copyWith(countOfStar: 3));
        }
      }
    }
    checkTheStateOfStar();
  }

  checkTheStateOfStar() {
    int stateOfGameStar = state.basicData?.gameData?.countOfMinimizeStar ?? 0;
    int countOfStar = state.countOfStar ?? 0;
    int countOfWrongAnswers = state.countOfWrongAnswers ?? 0;
    debugPrint('stateOfGameStar:$stateOfGameStar');
    debugPrint('countOfStar:$countOfStar');
    debugPrint('countOfWrongAnswers:$countOfWrongAnswers');
    debugPrint('countOfWrongAnswers:${countOfWrongAnswers % 2}');
    if (stateOfGameStar == 1) {
      if (countOfStar > 0) {
        countOfStar = countOfStar - countOfWrongAnswers;
        if (countOfStar < 0) {
          emit(state.copyWith(countOfStar: 0));
        } else {
          emit(state.copyWith(countOfStar: countOfStar));
        }
      }
    } else if (stateOfGameStar == 2) {
      if (countOfStar > 0) {
        if (countOfWrongAnswers == 1 || countOfWrongAnswers == 2) {
          countOfStar = countOfStar - 1;
          if (countOfStar < 0) {
            emit(state.copyWith(countOfStar: 0));
          } else {
            emit(state.copyWith(countOfStar: countOfStar));
          }
        } else if (countOfWrongAnswers == 3 || countOfWrongAnswers == 4) {
          countOfStar = countOfStar - 2;
          if (countOfStar < 0) {
            emit(state.copyWith(countOfStar: 0));
          } else {
            emit(state.copyWith(countOfStar: countOfStar));
          }
        }
      }
    }
  }

  increaseDirectlyCountOfStar() {
    int countOfStar = state.countOfStar ?? 0;
    emit(state.copyWith(countOfStar: (countOfStar + 1)));
  }

  Future addSuccessAnswer(
      {required int correctAnswers,
      required int questions,
      void Function()? subAction}) async {
    AudioPlayer playerCorrect = AudioPlayer();

    await _animationOfCorrectAnswer();
    await AudioPlayerGame.startPlaySoundOfCorrect(
        playerCorrect2: playerCorrect,
        soundPath: AppGameSound.getRandomSoundOfCorrect());
    await addStarToStudent(stateOfCountOfCorrectAnswer: correctAnswers);
    bool isLastLesson = checkIfIsTheLastQuestionOfGame(queations: questions);
    if (isLastLesson == true) {
      await Future.delayed(const Duration(seconds: 2));
      state.actionWhenTriesBeZero(state.countOfStar ?? 0);
    } else {
      playerCorrect.onPlayerComplete.listen((event) {
        debugPrint('################');
        backToMainAvatar();
        if (subAction != null) {
          subAction();
        }
      });
    }
  }

  Future<void> addWrongAnswer({void Function()? actionOfWrongAnswer}) async {
    AudioPlayer playerWrong = AudioPlayer();

    await _animationOfWrongAnswer();
    await _increaseCountOfWrongAnswer();
    await AudioPlayerGame.startPlaySoundOfWrong(
        playerWrong2: playerWrong,
        soundPath: AppGameSound.getRandomSoundOfWrong());
    if (actionOfWrongAnswer != null) {
      playerWrong.onPlayerComplete.listen((event) {
        actionOfWrongAnswer.call();
      });
    }
    playerWrong.onPlayerComplete.listen((event) {
      backToMainAvatar();
    });
  }

  _increaseCountOfWrongAnswer() {
    int countOfWrongAnswers = state.countOfWrongAnswers;
    countOfWrongAnswers++;
    emit(state.copyWith(countOfWrongAnswers: countOfWrongAnswers));
    addStarToStudent(stateOfCountOfCorrectAnswer: state.countOfCorrectAnswers);
  }

  _animationOfWrongAnswer() {
    emit(state.copyWith(
        avatarCurrentArtboard: state.avatarArtboardSad,
        stateOfAvatar: BasicOfGameData.stateOfSad));
    decreaseCountOfTries();
  }

  Future<void> _animationOfCorrectAnswer() async {
    emit(state.copyWith(
        avatarCurrentArtboard: state.avatarArtboardSuccess,
        stateOfAvatar: BasicOfGameData.stateOfWin));
  }

  backToMainAvatar() async {
    // await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
        avatarCurrentArtboard: state.avatarArtboardIdle,
        stateOfAvatar: BasicOfGameData.stateOIdle));
  }

  Map<int, Offset> touchPositions = <int, Offset>{};
  void savePointerPosition(int index, Offset position) {
    touchPositions[index] = position;
    emit(state.copyWith(touchPositions: !(state.touchPositions ?? false)));
  }

  clearPointerPosition(int index) {
    touchPositions.remove(index);
    emit(state.copyWith(touchPositions: !(state.touchPositions ?? false)));
  }

  beeTalkingTrue() {
    emit(state.copyWith(beeTalking: true));
  }

  beeTalkingFalse() {
    emit(state.copyWith(beeTalking: false));
  }

  saveCurrentStringOfDice({required String letter}) {
    emit(state.copyWith(currentStringOfDice: letter));
  }

  clearCurrentStringOfDice() {
    emit(state.clearCurrentStringOfDice());
  }
}
