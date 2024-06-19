import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:games_models/games_models.dart';
import '../../../core/phonetics_color.dart';
import '../../../core/talk_tts.dart';
import '../../../cubit/current_game_phonetics_cubit.dart';

part 'tracing_state.dart';

class TracingCubit extends Cubit<TracingInitial> {
  TracingCubit(
      {required GameModel gameData,
      required CurrentGamePhoneticsState stateOfGame})
      : super(TracingInitial(
          colorsOfPaths: [],
          gameData: gameData,
          stateOfGame: stateOfGame,
        )) {
    List<Color?> bgOfPaths = List.generate(
        state.stateOfGame.basicData?.countOfPartsOfLettersForTracing ?? 0,
        (index) => null);
    emit(state.clearData());

    TalkTts.startTalk(text: state.gameData.inst ?? '');
    emit(state.copyWith(
      colorsOfPaths: bgOfPaths,
    ));
  }

  checkTheLocationOfPoint({required Offset point, required Size size}) async {
    try {
      if (state.stateOfGame.basicData?.checkTheIndexOfPath != null) {
        int indexOfPoint =
            state.stateOfGame.basicData?.checkTheIndexOfPath!(point, size) ?? 0;
        debugPrint('indexOfPoint:$indexOfPoint');
        debugPrint(
            '##:${state.colorsOfPaths.where((element) => element == null).isNotEmpty}');
        debugPrint('before:${state.colorsOfPaths}');

        if (indexOfPoint == 1 &&
            state.colorsOfPaths
                .where((element) => element == null)
                .isNotEmpty) {
          indexOfPoint = indexOfPoint - 1;
          List<Color?> tempColors = state.colorsOfPaths;
          tempColors[indexOfPoint] = AppColorPhonetics.lightBlueColor4;
          emit(state.copyWith(colorsOfPaths: tempColors));
        } else if (state.colorsOfPaths[indexOfPoint - 2] != null) {
          indexOfPoint = indexOfPoint - 1;
          List<Color?> tempColors = state.colorsOfPaths;
          tempColors[indexOfPoint] = AppColorPhonetics.lightBlueColor4;
          emit(state.copyWith(colorsOfPaths: tempColors));
        }
        debugPrint('after:${state.colorsOfPaths}');
      }
    } catch (e) {
      debugPrint('check:$e');
    }
  }

  saveCurrentPosition(
      {required Offset? position, required Offset point, required Size size}) {
    try {
      if (position != null) {
        int indexOfPoint =
            state.stateOfGame.basicData?.checkTheIndexOfPath!(point, size) ?? 0;
        indexOfPoint = indexOfPoint - 1;
        List<Color?> tempColors = state.colorsOfPaths;
        if (tempColors[indexOfPoint] == null) {
          emit(state.copyWith(currentPosition: position));
        }
      } else {
        emit(state.clearPosition());
      }
    } catch (e) {
      debugPrint('check:$e');
    }
  }
}
