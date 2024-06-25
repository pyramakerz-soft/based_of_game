import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../src_model/export_models.dart';

part 'drag_word_to_pic_state.dart';

class DragWordToPicCubit extends Cubit<DragWordToPicInitial> {
  DragWordToPicCubit({
    required GameFinalModel gameData,
  }) : super(DragWordToPicInitial(
          gameData: gameData,
          correctedAnswers: [],
        )) {
    List<GameImagesGameFinalModel>? gameImages = (gameData.gameImages??[]);
    gameImages.shuffle();
    emit(state.copyWith(
      gameImages: _splitListIntoTwo(gameData.gameImages ?? []).first
          as List<GameImagesGameFinalModel>,
      gameImages2: _splitListIntoTwo(gameData.gameImages ?? []).last
          as List<GameImagesGameFinalModel>,
        mainGameImages:gameImages
    ));
  }
  List<List<GameImagesGameFinalModel>>
      _splitListIntoTwo<GameImagesGameFinalModel>(
          List<GameImagesGameFinalModel> list) {
    int middleIndex = (list.length / 2).ceil();
    List<GameImagesGameFinalModel> firstHalf = list.sublist(0, middleIndex);
    List<GameImagesGameFinalModel> secondHalf = list.sublist(middleIndex);
    return [firstHalf, secondHalf];
  }

  addCorrectAnswer({required int correctAnswerId}) {
    List<int> correctedAnswers = state.correctedAnswers;
    correctedAnswers.add(correctAnswerId);
    emit(state.copyWith(correctedAnswers: correctedAnswers));
  }
}
