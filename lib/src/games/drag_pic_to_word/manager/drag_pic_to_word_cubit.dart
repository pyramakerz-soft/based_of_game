import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../src_model/export_models.dart';

part 'drag_pic_to_word_state.dart';

class DragPicToWordCubit extends Cubit<DragPicToWordInitial> {
  DragPicToWordCubit({
    required GameFinalModel gameData,
  }) : super(DragPicToWordInitial(
          gameData: gameData,
          gameImages: gameData.gameImages ?? [],
          correctedAnswers: [],
        ));

  addCorrectAnswer({required int correctAnswerId}) {
    List<int> correctedAnswers = state.correctedAnswers;
    correctedAnswers.add(correctAnswerId);
    emit(state.copyWith(correctedAnswers: correctedAnswers));
  }
}
