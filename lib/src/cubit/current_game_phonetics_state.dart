part of 'current_game_phonetics_cubit.dart';

class CurrentGamePhoneticsState extends Equatable {
  Artboard? avatarArtboardIdle;
  Artboard? avatarArtboardSuccess;
  Artboard? avatarArtboardSad;
  Artboard? avatarCurrentArtboard;
  bool? touchPositions = false;
  String? stateOfAvatar;
  String? stateOfStringWillSay;
  bool? stateOfStringIsWord;
  bool beeTalking;
  int countOfWrongAnswers;
  int countOfCorrectAnswers;
  String? currentStringOfDice;
  void Function(int x) actionWhenTriesBeZero;
  String? currentAvatar;
  int index;
  int? countOfTries;
  List<GameModel>? gameData;
  List<int>? statesOfAddStars;
  int? countOfStar = 0;
  MainDataOfChapters? basicData;
  CurrentGamePhoneticsState(
      {this.basicData,
      this.gameData,
      this.avatarCurrentArtboard,
      this.stateOfStringIsWord,
      this.stateOfStringWillSay,
      required this.actionWhenTriesBeZero,
      this.stateOfAvatar,
      this.avatarArtboardIdle,
      this.avatarArtboardSad,
      this.beeTalking = false,
      this.touchPositions,
      this.currentStringOfDice,
      this.avatarArtboardSuccess,
      this.countOfWrongAnswers = 0,
      this.countOfCorrectAnswers = 0,
      this.statesOfAddStars,
      this.countOfTries,
      this.currentAvatar,
      required this.index,
      this.countOfStar});

  CurrentGamePhoneticsState copyWith(
      {MainDataOfChapters? basicData,
      Artboard? avatarArtboardSuccess,
      Artboard? avatarArtboardIdle,
      Artboard? avatarArtboardSad,
      bool? touchPositions,
      bool? stateOfStringIsWord,
      bool? beeTalking,
      Artboard? avatarCurrentArtboard,
      String? stateOfStringWillSay,
      String? currentStringOfDice,
      void Function(int x)? actionWhenTriesBeZero,
      String? currentAvatar,
      String? stateOfAvatar,
      List<GameModel>? gameData,
      List<int>? statesOfAddStars,
      int? index,
      int? countOfTries,
      int? countOfWrongAnswers,
      int? countOfCorrectAnswers,
      int? countOfCorrectAnswer,
      int? countOfStar}) {
    return CurrentGamePhoneticsState(
        basicData: basicData ?? this.basicData,
        index: index ?? this.index,
        currentStringOfDice: currentStringOfDice ?? this.currentStringOfDice,
        touchPositions: touchPositions ?? this.touchPositions,
        actionWhenTriesBeZero:
            actionWhenTriesBeZero ?? this.actionWhenTriesBeZero,
        stateOfStringWillSay: stateOfStringWillSay ?? this.stateOfStringWillSay,
        avatarCurrentArtboard:
            avatarCurrentArtboard ?? this.avatarCurrentArtboard,
        gameData: gameData ?? this.gameData,
        countOfWrongAnswers: countOfWrongAnswers ?? this.countOfWrongAnswers,
        beeTalking: beeTalking ?? this.beeTalking,
        countOfCorrectAnswers:
            countOfCorrectAnswers ?? this.countOfCorrectAnswers,
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
        index: index,
        currentStringOfDice: null,
        touchPositions: touchPositions ?? touchPositions,
        actionWhenTriesBeZero: actionWhenTriesBeZero,
        stateOfStringWillSay: stateOfStringWillSay ?? stateOfStringWillSay,
        avatarCurrentArtboard: avatarCurrentArtboard ?? avatarCurrentArtboard,
        gameData: gameData ?? gameData,
        countOfWrongAnswers: countOfWrongAnswers,
        beeTalking: beeTalking,
        countOfCorrectAnswers: countOfCorrectAnswers,
        stateOfStringIsWord: stateOfStringIsWord ?? stateOfStringIsWord,
        statesOfAddStars: statesOfAddStars ?? statesOfAddStars,
        stateOfAvatar: stateOfAvatar ?? stateOfAvatar,
        currentAvatar: currentAvatar ?? currentAvatar,
        avatarArtboardSad: avatarArtboardSad ?? avatarArtboardSad,
        countOfTries: countOfTries ?? countOfTries,
        avatarArtboardSuccess: avatarArtboardSuccess ?? avatarArtboardSuccess,
        avatarArtboardIdle: avatarArtboardIdle ?? avatarArtboardIdle,
        countOfStar: countOfStar ?? countOfStar);
  }

  CurrentGamePhoneticsState clearAllData() {
    return CurrentGamePhoneticsState(
      index: 0,
      actionWhenTriesBeZero: actionWhenTriesBeZero,
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
        currentStringOfDice,
        countOfWrongAnswers,
        beeTalking,
        countOfCorrectAnswers,
        avatarArtboardSuccess,
        actionWhenTriesBeZero,
        gameData,
        avatarCurrentArtboard,
        touchPositions,
        countOfTries,
        stateOfAvatar,
        statesOfAddStars,
        index,
        countOfStar
      ];
}
