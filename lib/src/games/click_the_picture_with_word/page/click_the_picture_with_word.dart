import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_models/games_models.dart';
import '../../../core/games_structure/basic_of_game_data.dart';
import '../../../core/phonetics_color.dart';
import '../../../cubit/current_game_phonetics_cubit.dart';
import '../../click_the_picture/widgets/single_row.dart';
import '../manager/click_the_picture_with_word_cubit.dart';

class ClickThePictureWithWord extends StatefulWidget {
  const ClickThePictureWithWord({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClickThePictureWithWord();
  }
}

class _ClickThePictureWithWord extends State<ClickThePictureWithWord> {
  @override
  void initState() {
    final GameModel gameData =
        context.read<ClickThePictureWithWordCubit>().state.gameData;
    context.read<CurrentGamePhoneticsCubit>().getStateOfStars(
        mainCountOfQuestion: (gameData.gameImages?.length ?? 0));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isInteracting =
        context.watch<CurrentGamePhoneticsCubit>().state.stateOfAvatar;

    return Container(
        margin: const EdgeInsets.only(bottom: (30), left: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width - (130 + 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.boarderColor, width: 5)),
        child: BlocConsumer<ClickThePictureWithWordCubit,
            ClickThePictureWithWordInitial>(listener: (context, state) {
          context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
              stateOfStringIsWord: true,
              stateOfStringWillSay: state.chooseWord?.word ?? '');
        }, builder: (context, gameState) {
          return Wrap(
              spacing: 10,
              // runSpacing: 10,
              alignment: WrapAlignment.center,
              children: List.generate(
                  (gameState.gameImages?.length ?? 0),
                  (index) => SingleElement(
                      width: (MediaQuery.of(context).size.width - (130 + 40)) /
                          (((gameState.gameImages?.length ?? 0) / 2) + 1)
                              .round(),
                      height:
                          (MediaQuery.of(context).size.height - (50.h + 90)) /
                              2.2,
                      //     (gameData.gameImages?.length ?? 0),
                      index: index,
                      background: gameState.backGround[index],
                      image: gameState.gameImages?[index].image ?? '',
                      selected: gameState.correctIndexes
                          .contains(gameState.gameImages?[index].id),
                      onTap: isInteracting != null &&
                              isInteracting != BasicOfGameData.stateOIdle
                          ? null
                          : () async {
                              if (!gameState.correctIndexes
                                  .contains(gameState.gameImages?[index].id)) {
                                if ((gameState.chooseWord?.word ?? '') ==
                                    (gameState.gameImages?[index].word)) {
                                  await context
                                      .read<ClickThePictureWithWordCubit>()
                                      .addTheCorrectAnswer(
                                          idOfUserAnswer: (gameState
                                                  .gameImages?[index].id ??
                                              0));
                                  await context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .addSuccessAnswer(
                                          subAction: () async {
                                            print(
                                                'subAction:${gameState.chooseWord?.word}');
                                            await context
                                                .read<
                                                    ClickThePictureWithWordCubit>()
                                                .getTheRandomWord();
                                          },
                                          questions:
                                              gameState.gameImages?.length ?? 0,
                                          correctAnswers:
                                              gameState.correctIndexes.length)
                                      .whenComplete(() async {
                                    bool isLastQuestion = context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .checkIfIsTheLastQuestionOfGame(
                                            queations:
                                                gameState.gameImages?.length ??
                                                    0);
                                    if (isLastQuestion) {
                                      Future.delayed(const Duration(seconds: 2),
                                          () async {
                                        Navigator.of(context).pop();
                                      });
                                    } else {}
                                  });
                                } else {
                                  await context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .addWrongAnswer(
                                          actionOfWrongAnswer: () async {
                                    await context
                                        .read<ClickThePictureWithWordCubit>()
                                        .sayTheLetter();
                                  });
                                }
                              }
                            })));
        }));
  }
}
