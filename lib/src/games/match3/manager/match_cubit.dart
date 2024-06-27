// import 'dart:ui';
//
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:meta/meta.dart';
//
// import '../../../../src_model/export_models.dart';
// import '../../../core/talk_tts.dart';
//
// part 'match_state.dart';
//
// class MatchCubit extends Cubit<MatchInitial> {
//   MatchCubit({
//     required List<GameFinalModel> listGameData,
//     required int index,
//   }) : super(MatchInitial(
//           gameData: listGameData[index],
//           index: index,
//           listGameData: listGameData,
//           mainDataWillCheck: [],
//           positions: [],
//           finalDataWillShow: [],
//           widgetKey: [],
//         )) {
//     reFormatAnswers();
//   }
//
//   reFormatAnswers() {
//     GameFinalModel data = state.gameData;
//     List<GameImagesGameFinalModel> answers = data.gameImages ?? [];
//     List<GameImagesGameFinalModel> imageAnswers = data.gameImages ?? [];
//     List<GameImagesGameFinalModel> finalResult = [];
//     answers.shuffle();
//     for (int i = 0; i < imageAnswers.length; i++) {
//       finalResult.add(GameImagesGameFinalModel(
//           image: imageAnswers[i].image,
//           word: answers[answers.length - (i + 1)].word));
//     }
//     finalResult.shuffle();
//     emit(state.copyWith(
//         finalDataWillShow: finalResult,
//         mainDataWillCheck: answers,
//         widgetKey: List.generate(answers.length * 3, (index) => GlobalKey()),
//         positions: List.generate(answers.length, (index) => [null, null])));
//   }
//
//   addCorrectAnswer(
//       {required int index, required Offset position, required bool isFirst}) {
//     int countOfCorrect = state.countCorrectAnswers;
//     List<List<Offset?>> positions = state.positions;
//     if (isFirst == true) {
//       // try {
//       //   List<List<Offset?>> subPositions = positions
//       //       .where((test) => test.last != null && test.first == null)
//       //       .toList();
//       //   int x = positions.indexOf(subPositions.first);
//       //   positions[x].first = position;
//       // } catch (e) {
//       positions[index].first = position;
//       // }
//       print('positions:$positions');
//     } else {
//       // List<List<Offset?>> subPositions = positions
//       //     .where((test) => test.first != null && test.last == null)
//       //     .toList();
//       // if (subPositions.isNotEmpty) {
//       //   int x = positions.indexOf(subPositions.first);
//       //
//       //   positions[x].last = position;
//       // } else {
//       positions[index].last = position;
//       // }
//       print('1positions:$positions');
//     }
//     countOfCorrect++;
//     emit(state.copyWith(
//         countCorrectAnswers: countOfCorrect, positions: positions));
//   }
//
//   updateTheCurrentGame({required int index}) {
//     debugPrint('updateTheCurrentGame:${state.gameData.id}, $index');
//     emit(state.copyWith(gameData: state.listGameData[index], index: index));
//     debugPrint('updateTheCurrentGame:${state.gameData.id}');
//     reFormatAnswers();
//   }
// }
