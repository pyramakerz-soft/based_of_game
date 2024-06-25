part of 'x_out_cubit.dart';

@immutable
class XOutInitial extends Equatable {
  final List<GameFinalModel> listGameData;
  final GameFinalModel? gameData;
  final int? correctAnswers;
  final int currentGameIndex;
  final List<int>? selectedItems;

  const XOutInitial({
    required this.listGameData,
    this.gameData,
    this.correctAnswers = 0,
    required this.currentGameIndex,
    this.selectedItems = const [],
  });

  XOutInitial copyWith({
    List<GameFinalModel>? listGameData,
    int? correctAnswers,
    GameFinalModel? gameData,
    int? currentGameIndex,
    List<int>? selectedItems,
    // bool? isInteracting,
  }) {
    return XOutInitial(
      listGameData: listGameData ?? this.listGameData,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      currentGameIndex: currentGameIndex ?? this.currentGameIndex,
      selectedItems: selectedItems ?? this.selectedItems,
      gameData: gameData ?? this.gameData,
    );
  }

  XOutInitial clearCurrentCorrectAnswers() {
    return XOutInitial(
      listGameData: listGameData,
      correctAnswers: null,
      currentGameIndex: currentGameIndex,
      selectedItems: null,
      gameData: gameData ?? gameData,
    );
  }

  @override
  List<Object?> get props =>
      [listGameData, correctAnswers, selectedItems, currentGameIndex, gameData];
}
