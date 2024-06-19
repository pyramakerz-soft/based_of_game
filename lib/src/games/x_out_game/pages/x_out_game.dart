import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_models/games_models.dart';

import '../../../core/games_structure/basic_of_game_data.dart';
import '../../../core/phonetics_color.dart';
import '../../../core/theme_text.dart';
import '../../../cubit/current_game_phonetics_cubit.dart';
import '../manager/x_out_cubit.dart';
import '../widget/item_of_x_out.dart';

class XOutGameScreen extends StatefulWidget {
  const XOutGameScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _XOutGameScreen();
  }
}

class _XOutGameScreen extends State<XOutGameScreen> {
  @override
  void initState() {
    final List<GameModel> gameData =
        context.read<XOutCubit>().state.listGameData;
    context
        .read<CurrentGamePhoneticsCubit>()
        .getStateOfStars(mainCountOfQuestion: gameData.length);
    context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
        stateOfStringIsWord: true,
        stateOfStringWillSay: gameData.first.mainLetter ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isInteracting =
        context.watch<CurrentGamePhoneticsCubit>().state.stateOfAvatar;

    final screenHeight = MediaQuery.of(context).size.height - 90.h;
    final screenWidth = MediaQuery.of(context).size.width - 120.w;
    final gridItemHeight = (screenHeight - 4 - 40 - 2 * 15) /
        2; // 4 for padding, 40 for text height, 2 * 15 for border radius
    final gridItemWidth =
        (screenWidth - 4 - 3 * 2) / 2; // 4 for padding, 3 * 2 for border width
    return BlocConsumer<XOutCubit, XOutInitial>(
      listener: (context, state) {
        context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
            stateOfStringIsWord: false,
            stateOfStringWillSay: state.gameData?.mainLetter ?? '');
      },
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 15.w),
          width: screenWidth,
          height: screenHeight,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColorPhonetics.darkBorderColor,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.darkBorderColor, width: 5),
          ),
          child: Column(
            children: [
              Text(
                state.gameData?.mainLetter ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppTheme.getFontFamily5(),
                      color: Colors.white,
                      height: 0,
                      letterSpacing: 0.50,
                    ),
              ),
              if (state.gameData?.gameImages?.isNotEmpty ?? false) ...{
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      childAspectRatio: gridItemWidth /
                          gridItemHeight, // Aspect ratio of each item
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final isSelected =
                          state.selectedItems?.contains(index) == true;
                      final isCorrect =
                          state.gameData?.gameImages?[index].correct == 0;
                      final bool gameHasData =
                          state.gameData?.gameImages?.isEmpty ?? false;
                      return gameHasData
                          ? const SizedBox()
                          : XOutItemWidget(
                              imageName:
                                  state.gameData?.gameImages?[index].image ??
                                      "",
                              isSelected: isSelected,
                              isCorrect: isCorrect,
                              onTap: isInteracting != null &&
                                      isInteracting !=
                                          BasicOfGameData.stateOIdle
                                  ? null
                                  : () async {
                                      if (state.gameData?.gameImages?[index]
                                              .correct ==
                                          0) {
                                        await context
                                            .read<XOutCubit>()
                                            .selectItem(index);
                                        await context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .addSuccessAnswer(
                                                questions:
                                                    state.listGameData.length ??
                                                        0,
                                                correctAnswers:
                                                    (state.currentGameIndex) +
                                                        1)
                                            .whenComplete(() async {
                                          bool isLastQuestion = context
                                              .read<CurrentGamePhoneticsCubit>()
                                              .checkIfIsTheLastQuestionOfGame(
                                                  queations: state
                                                      .listGameData.length);
                                          if (isLastQuestion) {
                                            Future.delayed(
                                                const Duration(seconds: 2),
                                                () async {
                                              Navigator.of(context).pop();
                                            });
                                          } else {
                                            await context
                                                .read<
                                                    CurrentGamePhoneticsCubit>()
                                                .updateIndexOfCurrentGame();
                                            await context
                                                .read<XOutCubit>()
                                                .updateTheCurrentGame(
                                                    index: context
                                                        .read<
                                                            CurrentGamePhoneticsCubit>()
                                                        .state
                                                        .index);
                                          }
                                        });
                                      } else {
                                        await context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .addWrongAnswer(
                                                actionOfWrongAnswer:
                                                    () async {});
                                      }
                                    },
                              word:
                                  state.gameData?.gameImages?[index].word ?? '',
                            );
                    },
                  ),
                ),
              }
            ],
          ),
        );
      },
    );
  }
}
