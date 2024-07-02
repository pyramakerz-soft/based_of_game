part of 'x_out_cubit.dart';

@immutable
class XOutInitial extends Equatable {
  final List<GameFinalModel> listGameData;
  final GameFinalModel? gameData;
  final int? correctAnswers;
  final int currentGameIndex;
  final int? isWrong;
  final List<int>? selectedItems;

  const XOutInitial({
    required this.listGameData,
    this.gameData,
    this.correctAnswers = 0,
    this.isWrong ,
    required this.currentGameIndex,
    this.selectedItems = const [],
  });

  XOutInitial copyWith({
    List<GameFinalModel>? listGameData,
    int? correctAnswers,
    GameFinalModel? gameData,
    int? currentGameIndex,
    int? isWrong,
    List<int>? selectedItems,
    // bool? isInteracting,
  }) {
    return XOutInitial(
      listGameData: listGameData ?? this.listGameData,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      currentGameIndex: currentGameIndex ?? this.currentGameIndex,
      isWrong: isWrong ?? this.isWrong,
      selectedItems: selectedItems ?? this.selectedItems,
      gameData: gameData ?? this.gameData,
    );
  }

  XOutInitial clearCurrentCorrectAnswers() {
    return XOutInitial(
      listGameData: listGameData,
      correctAnswers: null,
      isWrong:null,
      currentGameIndex: currentGameIndex,
      selectedItems: null,
      gameData: gameData ?? gameData,
    );
  }

  XOutInitial clearWrongStateAnswer() {
    return XOutInitial(
      listGameData: listGameData,
      correctAnswers: correctAnswers,
      isWrong:null,
      currentGameIndex: currentGameIndex,
      selectedItems: selectedItems,
      gameData: gameData ?? gameData,
    );
  }

  @override
  List<Object?> get props =>
      [listGameData, correctAnswers, selectedItems, currentGameIndex, gameData, isWrong];
}
