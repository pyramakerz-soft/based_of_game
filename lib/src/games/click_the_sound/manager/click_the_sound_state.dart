part of 'click_the_sound_cubit.dart';

class ClickTheSoundInitial extends Equatable {
  final GameFinalModel gameData;
  List<String>? letters;
  List<int>? correctIndexes = [];

  ClickTheSoundInitial({
    required this.gameData,
    this.letters,
    this.correctIndexes,
  });

  ClickTheSoundInitial copyWith({
    GameFinalModel? gameData,
    List<String>? letters,
    int? correctAnswers,
    List<int>? correctIndexes,
    // bool? isInteracting,
  }) {
    return ClickTheSoundInitial(
      gameData: gameData ?? this.gameData,
      letters: letters ?? this.letters,
      // correctAnswers: correctAnswers ?? this.correctAnswers,
      correctIndexes: correctIndexes ?? this.correctIndexes,
      // isInteracting: isInteracting ?? this.isInteracting,
    );
  }

  @override
  List<Object?> get props => [
        gameData,
        letters,
        correctIndexes,
        // isInteracting,
      ];
}
