import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:games_models/games_models.dart';
import '../../based_of_game.dart';
import '../core/assets_game_sound.dart';
import '../core/audio_player_game.dart';
import '../core/basic_of_every_game.dart';
import '../core/basic_of_phonetics.dart';

part 'current_game_phonetics_state.dart';

class CurrentGamePhoneticsCubit extends Cubit<CurrentGamePhoneticsState> {
  final MainDataOfPhonetics _basicData;
  final List<GameModel> _gameData;
  CurrentGamePhoneticsCubit(
      {required MainDataOfPhonetics basicData,
      required List<GameModel> gameData})
      : _gameData = gameData,
        _basicData = basicData,
        super(CurrentGamePhoneticsState(index: 0)) {
    checkDataOfCubit();
    updateDataOfCurrentGame(
        basicData: _basicData, gameData: _gameData, gameIndex: 0);
  }
  checkDataOfCubit() {
    if (state.actionWhenTriesBeZero == null) {
      return Exception("actionWhenTriesBeZero can't be null");
    }
    if (state.index > (state.gameData?.length ?? 0)) {
      return Exception("check the game data");
    }
  }

  getTheBackGround() {
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
          log('###');
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

  getTheBackGroundSuccess() {
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
          log('###');
          log(e.toString());
        }
      },
    );
  }

  getTheBackGroundSad() {
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
          log('###');
          log(e.toString());
        }
      },
    );
  }

  updateIndexOfCurrentGame({required int nextIndex}) {
    int currentIndex = state.index;
    currentIndex = currentIndex + 1;
    emit(state.copyWith(index: currentIndex));
  }

  updateDataOfCurrentGame(
      {required MainDataOfPhonetics basicData,
      required List<GameModel> gameData,
      required int gameIndex}) async {
    emit(state.clearAllData());
    emit(state.copyWith(
        basicData: basicData,
        currentAvatar: basicData.basicAvatar,
        index: gameIndex,
        gameData: gameData));
    saveCountOfTries();
    getTheBackGround();
    getTheBackGroundSuccess();
    getTheBackGroundSad();
  }

  saveCountOfTries() {
    int countOfTries = state.gameData?[state.index].numOfTrials ?? 0;
    emit(state.copyWith(countOfTries: countOfTries, countOfStar: 0));
  }

  decreaseCountOfTries() {
    int countOfTries = (state.countOfTries ?? 1) - 1;
    emit(state.copyWith(countOfTries: countOfTries));
    if (state.countOfTries == 0) {
      state.actionWhenTriesBeZero!();
    }
  }

  increaseCountOfTries() {
    int countOfTries = state.gameData?[state.index].numOfTrials ?? 0;
    emit(state.copyWith(countOfTries: countOfTries));
  }

  bool checkIfIsTheLastGameOfLesson() {
    int currentIndex = state.index;
    currentIndex = currentIndex + 1;
    if ((state.gameData?.length ?? 0) > currentIndex) {
      return false;
    } else {
      return true;
    }
  }

  addStarToStudent(
      {required int stateOfCountOfCorrectAnswer,
      required int mainCountOfQuestion}) {
    print('addStarToStudent');
    int countOfStar = state.countOfStar ?? 0;
    List<int> stateOfStarsAdd =
        BasicOfEveryGame.getTheStarsAddState(mainCountOfQuestion);
    if ((mainCountOfQuestion) > 2) {
      if (stateOfStarsAdd[0] == stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: (countOfStar + 1)));
      } else if ((stateOfStarsAdd[1] + stateOfStarsAdd[0]) ==
          stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: (countOfStar + 1)));
      } else if ((stateOfStarsAdd[2] +
              stateOfStarsAdd[0] +
              stateOfStarsAdd[1]) ==
          stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: (countOfStar + 1)));
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
  }

  increaseDirectlyCountOfStar() {
    int countOfStar = state.countOfStar ?? 0;
    emit(state.copyWith(countOfStar: (countOfStar + 1)));
  }

  addSuccessAnswer(
      {required void Function() actionInEndOfLesson, int? nextGameId}) async {
    await animationOfCorrectAnswer();
    await AudioPlayerGame.startPlaySound(
        soundPath: AppGameSound.getRandomSoundOfCorrect());
    bool isLastLesson = nextGameId == null;
    // checkIfIsTheLastGameOfLesson();

    if (isLastLesson == true) {
      await Future.delayed(const Duration(seconds: 2));
      actionInEndOfLesson.call();
    } else {
      await backToMainAvatar();
      if (nextGameId != null)
        updateIndexOfCurrentGame(
            nextIndex: state.gameData!
                .indexWhere((element) => element.id == nextGameId));
    }
  }

  Future<void> addWrongAnswer({void Function()? actionOfWrongAnswer}) async {
    await AudioPlayerGame.startPlaySound(
        soundPath: AppGameSound.getRandomSoundOfWrong());
    await animationOfWrongAnswer();
    if (actionOfWrongAnswer != null) {
      AudioPlayerGame.player.onPlayerComplete.listen((event) {
        actionOfWrongAnswer.call();
      });
    }
    await backToMainAvatar();
  }

  animationOfWrongAnswer() {
    emit(state.copyWith(
        avatarCurrentArtboard: state.avatarArtboardSad,
        stateOfAvatar: BasicOfEveryGame.stateOfSad));
    decreaseCountOfTries();
  }

  Future<void> animationOfCorrectAnswer() async {
    print('animationOfCorrectAnswer');
    emit(state.copyWith(
        avatarCurrentArtboard: state.avatarArtboardSuccess,
        stateOfAvatar: BasicOfEveryGame.stateOfWin));
    print('animationOfCorrectAnswer:${state.stateOfAvatar}');

    await AudioPlayerGame.startPlaySound(
        soundPath: AppGameSound.getRandomSoundOfCorrect());
  }

  backToMainAvatar() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
        avatarCurrentArtboard: state.avatarArtboardIdle,
        stateOfAvatar: BasicOfEveryGame.stateOIdle));
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

  saveCurrentStringOfDice({required String letter}) {
    emit(state.copyWith(currentStringOfDice: letter));
  }

  clearCurrentStringOfDice() {
    emit(state.clearCurrentStringOfDice());
  }

  sendStars(
      {required List<int> gamesId,
      required void Function(int countOfStars, List<int> listOfIds)
          actionOfStars}) {
    actionOfStars.call((state.countOfStar ?? 0), gamesId);
  }
}
