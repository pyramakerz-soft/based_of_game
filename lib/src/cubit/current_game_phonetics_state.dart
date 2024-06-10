part of 'current_game_phonetics_cubit.dart';

enum StateOfMainGame {
  increaseIndex,
  currentIndex,
}

class CurrentGamePhoneticsState extends Equatable {
  Artboard? avatarArtboardIdle;
  Artboard? avatarArtboardSuccess;
  Artboard? avatarArtboardSad;
  Artboard? avatarCurrentArtboard;
  bool? touchPositions = false;
  String? stateOfAvatar;
  String? stateOfStringWillSay;
  bool? stateOfStringIsWord;

  void Function()? actionWhenTriesBeZero;
  String? currentAvatar;
  int index;
  int? countOfTries;
  List<GameModel>? gameData;
  List<int>? statesOfAddStars;
  int? countOfStar = 0;
  MainDataOfPhonetics? basicData;
  String? currentStringOfDice;
  CurrentGamePhoneticsState(
      {this.basicData,
      this.gameData,
      this.avatarCurrentArtboard,
      this.stateOfStringIsWord,
      this.stateOfStringWillSay,
      this.actionWhenTriesBeZero,
      this.stateOfAvatar,
      this.currentStringOfDice,
      this.avatarArtboardIdle,
      this.avatarArtboardSad,
      this.touchPositions,
      this.avatarArtboardSuccess,
      this.statesOfAddStars,
      this.countOfTries,
      this.currentAvatar,
      required this.index,
      this.countOfStar});

  CurrentGamePhoneticsState copyWith(
      {MainDataOfPhonetics? basicData,
      Artboard? avatarArtboardSuccess,
      Artboard? avatarArtboardIdle,
      Artboard? avatarArtboardSad,
      bool? touchPositions,
      bool? stateOfStringIsWord,
      Artboard? avatarCurrentArtboard,
      String? stateOfStringWillSay,
      String? currentStringOfDice,
      void Function()? actionWhenTriesBeZero,
      String? currentAvatar,
      String? stateOfAvatar,
      List<GameModel>? gameData,
      List<int>? statesOfAddStars,
      int? index,
      int? countOfTries,
      int? countOfCorrectAnswer,
      int? countOfStar}) {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? this.basicData,
        index: index ?? this.index,
        touchPositions: touchPositions ?? this.touchPositions,
        actionWhenTriesBeZero:
            actionWhenTriesBeZero ?? this.actionWhenTriesBeZero,
        stateOfStringWillSay: stateOfStringWillSay ?? this.stateOfStringWillSay,
        currentStringOfDice: currentStringOfDice ?? this.currentStringOfDice,
        avatarCurrentArtboard:
            avatarCurrentArtboard ?? this.avatarCurrentArtboard,
        gameData: gameData ?? this.gameData,
        stateOfStringIsWord: stateOfStringIsWord ?? this.stateOfStringIsWord,
        statesOfAddStars: statesOfAddStars ?? this.statesOfAddStars,
        stateOfAvatar: stateOfAvatar ?? this.stateOfAvatar,
        currentAvatar: currentAvatar ?? this.currentAvatar,
        avatarArtboardSad: avatarArtboardSad ?? this.avatarArtboardSad,
        countOfTries: countOfTries ?? this.countOfTries,
        avatarArtboardSuccess:
            avatarArtboardSuccess ?? this.avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? this.avatarArtboardIdle,
        countOfStar: countOfStar ?? this.countOfStar);
  }

  clearCurrentStringOfDice() {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? basicData,
        index: index ?? index,
        avatarCurrentArtboard: avatarCurrentArtboard,
        gameData: gameData ?? gameData,
        statesOfAddStars: statesOfAddStars ?? statesOfAddStars,
        stateOfStringWillSay: stateOfStringWillSay ?? stateOfStringWillSay,
        currentStringOfDice: null,
        stateOfAvatar: stateOfAvatar ?? stateOfAvatar,
        touchPositions: touchPositions,
        currentAvatar: currentAvatar ?? currentAvatar,
        actionWhenTriesBeZero: actionWhenTriesBeZero,
        stateOfStringIsWord: stateOfStringIsWord ?? stateOfStringIsWord,
        countOfTries: countOfTries ?? countOfTries,
        avatarArtboardSad: avatarArtboardSad ?? avatarArtboardSad,
        avatarArtboardSuccess: avatarArtboardSuccess ?? avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? avatarArtboardIdle,
        countOfStar: countOfStar ?? countOfStar);
  }

  CurrentGamePhoneticsState clearAllData() {
    return CurrentGamePhoneticsState(
      index: index,
    );
  }

  @override
  List<Object?> get props => [
        basicData,
        currentAvatar,
        avatarArtboardIdle,
        stateOfStringIsWord,
        stateOfStringWillSay,
        avatarArtboardSad,
        avatarArtboardSuccess,
        actionWhenTriesBeZero,
        gameData,
        avatarCurrentArtboard,
        currentStringOfDice,
        touchPositions,
        countOfTries,
        stateOfAvatar,
        statesOfAddStars,
        index,
        countOfStar
      ];
}
