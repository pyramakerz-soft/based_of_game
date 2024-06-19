import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/services.dart';
import 'package:games_models/games_models.dart';
import '../../based_of_game.dart';
import '../core/assets_game_sound.dart';
import '../core/audio_player_game.dart';
import '../core/games_structure/basic_of_game_data.dart';

part 'current_game_phonetics_state.dart';

class CurrentGamePhoneticsCubit extends Cubit<CurrentGamePhoneticsState> {
  CurrentGamePhoneticsCubit(
      {required MainDataOfChapters basicData,
      required void Function(int) actionOfCompleteGame,
      required List<GameModel> gameData})
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
      required List<GameModel> gameData,
      required int gameIndex}) async {
    emit(state.clearAllData());
    emit(state.copyWith(
        basicData: basicData,
        currentAvatar: basicData.basicAvatar,
        index: gameIndex,
        gameData: gameData));
    _saveCountOfTries();
  }

  _saveCountOfTries() {
    int countOfTries = 5; //state.gameData?[state.index].numOfTrials ?? 0;
    emit(state.copyWith(countOfTries: countOfTries, countOfStar: 0));
  }

  decreaseCountOfTries() {
    int countOfTries = (state.countOfTries ?? 1) - 1;
    emit(state.copyWith(countOfTries: countOfTries));
    if (state.countOfTries == 0) {
      state.actionWhenTriesBeZero!(state.countOfStar ?? 0);
    }
  }

  bool checkIfIsTheLastQuestionOfGame({required int queations}) {
    int countOfCorrectAnswers = state.countOfCorrectAnswers;
    print('countOfCorrectAnswers:$countOfCorrectAnswers , $queations');
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
    print(
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
      if (state.actionWhenTriesBeZero != null) {
        state.actionWhenTriesBeZero!(state.countOfStar ?? 0);
      }
    } else {
      playerCorrect.onPlayerComplete.listen((event) {
        print('################');
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
    // AudioPlayerGame.playerWrong.state.
    playerWrong.onPlayerComplete.listen((event) {
      backToMainAvatar();
    });
  }

  _increaseCountOfWrongAnswer() {
    int countOfWrongAnswers = state.countOfWrongAnswers ?? 0;
    countOfWrongAnswers++;
    emit(state.copyWith(countOfWrongAnswers: countOfWrongAnswers));
    _updateTheStarState();
  }

  _animationOfWrongAnswer() {
    emit(state.copyWith(
        avatarCurrentArtboard: state.avatarArtboardSad,
        stateOfAvatar: BasicOfGameData.stateOfSad));
    decreaseCountOfTries();
  }

  _updateTheStarState() {
    int countOfWrongAnswers = state.countOfWrongAnswers ?? 0;
    List<int> stateOfStarsAdd = state.statesOfAddStars ?? [];
    print('stateOfStarsAdd:$stateOfStarsAdd');
    int countOfAllStars = stateOfStarsAdd.fold(
        0, (previousValue, element) => previousValue + element);
    countOfWrongAnswers = countOfWrongAnswers + countOfAllStars;

    List<int> listStateOfStarsAdd =
        BaseOfGames.getTheStarsAddState(countOfWrongAnswers);
    emit(state.copyWith(statesOfAddStars: listStateOfStarsAdd));
    print('stateOfStarsAdd:$listStateOfStarsAdd');

    addStarToStudent(stateOfCountOfCorrectAnswer: state.countOfCorrectAnswers);
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
}
