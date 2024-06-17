import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_models/games_models.dart';
import '../../../core/assets_images_phonetics.dart';
import '../../../core/games_structure/basic_of_game.dart';
import '../../../core/phonetics_color.dart';
import '../../../core/talk_tts.dart';
import '../../../cubit/current_game_phonetics_cubit.dart';
import '../manager/drag_out_cubit.dart';

class DragOutGame extends StatefulWidget {
  const DragOutGame({super.key});
  @override
  State<StatefulWidget> createState() {
    return _DragOutGame();
  }
}

class _DragOutGame extends State<DragOutGame> {
  @override
  void initState() {
    final List<GameModel> gameData =
        context.read<DragOutCubit>().state.allGameData;
    context
        .read<CurrentGamePhoneticsCubit>()
        .getStateOfStars(mainCountOfQuestion: gameData.length);
    context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
        stateOfStringIsWord: true,
        stateOfStringWillSay: gameData.first.mainLetter ?? '');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateOfCurrentGamePhoneticsCubit =
        context.watch<CurrentGamePhoneticsCubit>().state;
    return Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height - (70.h),
        child: BlocConsumer<DragOutCubit, DragOutInitial>(
            listener: (context, state) {},
            builder: (context, gameState) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 15, left: 10),
                      child: DragTarget<GameImagesModel>(builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return (stateOfCurrentGamePhoneticsCubit
                                    .stateOfAvatar ==
                                BasicOfGame.stateOfWin)
                            ? Image.asset(
                                stateOfCurrentGamePhoneticsCubit
                                        .basicData?.gameData?.completeBasket ??
                                    '',
                                height:
                                    (MediaQuery.of(context).size.height / 2.8)
                                        .h,
                                width: 130,
                              )
                            : Image.asset(
                                AppImagesPhonetics.imageBasket,
                                height:
                                    (MediaQuery.of(context).size.height / 2.8)
                                        .h,
                                width: 130,
                              );
                      }, onAcceptWithDetails: (item) async {
                        if (item.data.word
                                .toString()
                                .split('')
                                .first
                                .toLowerCase() !=
                            (gameState.gameData.mainLetter?.toLowerCase() ??
                                '')) {
                          await context
                              .read<CurrentGamePhoneticsCubit>()
                              .addSuccessAnswer(
                                  questions: gameState.allGameData.length ?? 0,
                                  correctAnswers: (gameState.index) + 1)
                              .whenComplete(() async {
                            bool isLastQuestion = context
                                .read<CurrentGamePhoneticsCubit>()
                                .checkIfIsTheLastQuestionOfGame(
                                    queations: gameState.allGameData.length);
                            if (isLastQuestion) {
                              Future.delayed(const Duration(seconds: 2),
                                  () async {
                                Navigator.of(context).pop();
                              });
                            } else {
                              await context
                                  .read<CurrentGamePhoneticsCubit>()
                                  .updateIndexOfCurrentGame();
                              context.read<DragOutCubit>().updateTheCurrentGame(
                                  index: context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .state
                                      .index);
                            }
                          });
                        } else {
                          await context
                              .read<CurrentGamePhoneticsCubit>()
                              .addWrongAnswer(actionOfWrongAnswer: () async {});
                        }
                      })),
                  Container(
                    margin: const EdgeInsets.only(bottom: (15 + 50), top: 50),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    width: MediaQuery.of(context).size.width - (130 + 50 + 130),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColorPhonetics.boarderColor, width: 5)),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            gameState.gameData.gameImages?.length ?? 0,
                            (index) => Draggable<GameImagesModel>(
                                data: gameState.gameData.gameImages?[index],
                                childWhenDragging: SizedBox(
                                  width: (MediaQuery.of(context).size.width -
                                          (130 + 50 + 130)) /
                                      4,
                                  height: 130.h,
                                ),
                                feedback: CachedNetworkImage(
                                  imageUrl: gameState
                                          .gameData.gameImages?[index].image ??
                                      '',
                                  width: (MediaQuery.of(context).size.width -
                                          (130 + 50 + 130)) /
                                      4,
                                  height: 130.h,
                                  placeholder: (context, url) => const Center(
                                    child: CupertinoActivityIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => Text(
                                      '${gameState.gameData.gameImages?[index].word}'),
                                  // height: ,
                                ),
                                child: ((stateOfCurrentGamePhoneticsCubit
                                                .stateOfAvatar ==
                                            BasicOfGame.stateOfWin) &&
                                        (gameState.gameData.gameImages?[index]
                                                .word
                                                .toString()
                                                .split('')
                                                .first
                                                .toLowerCase() !=
                                            (gameState.gameData.mainLetter
                                                    ?.toLowerCase() ??
                                                '')))
                                    ? SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    (130 + 50 + 130)) /
                                                4,
                                        height: 130.h,
                                        // height: ,
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          TalkTts.startTalk(
                                              text: gameState
                                                      .gameData
                                                      .gameImages?[index]
                                                      .word ??
                                                  '');
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: gameState.gameData
                                                  .gameImages?[index].image ??
                                              '',
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  (130 + 50 + 130)) /
                                              4,
                                          height: 130.h,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CupertinoActivityIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                            child: Text(
                                                '${gameState.gameData.gameImages?[index].word}'),
                                          ),
                                          // height: ,
                                        ),
                                      ))),
                      ),
                    ),
                  )
                ],
              );
            }));
  }
}
