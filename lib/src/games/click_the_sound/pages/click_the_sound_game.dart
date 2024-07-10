import 'package:based_of_eng_game/src/widgets/empty_space.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../src_model/export_models.dart';
import '../../../core/assets_images_phonetics.dart';
import '../../../core/games_structure/basic_of_game_data.dart';
import '../../../core/phonetics_color.dart';
import '../../../cubit/current_game_phonetics_cubit.dart';
import '../manager/click_the_sound_cubit.dart';
import '../widgets/stroked_text_widget.dart';

class ClickTheSoundGame extends StatefulWidget {
  const ClickTheSoundGame({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClickTheSoundGame();
  }
}

class _ClickTheSoundGame extends State<ClickTheSoundGame> {
  @override
  void initState() {
    final GameFinalModel gameData =
        context.read<ClickTheSoundCubit>().state.gameData;
    context.read<CurrentGamePhoneticsCubit>().getStateOfStars(
        mainCountOfQuestion: gameData.gameLetters
                ?.where((element) => element.letter == gameData.mainLetter)
                .toList()
                .length ??
            0);

    context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
        stateOfStringIsWord: StateOfSubWord.isLetter,
        stateOfStringWillSay: gameData.mainLetter ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isInteracting =
        context.watch<CurrentGamePhoneticsCubit>().state.stateOfAvatar;
    return Container(
      margin: const EdgeInsets.only(bottom: 30, top: 50, left: 70),
      width: MediaQuery.of(context).size.width - 100.w,
      height: MediaQuery.of(context).size.width < 760
          ? MediaQuery.of(context).size.height * 0.7
          : MediaQuery.of(context).size.height * 0.65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColorPhonetics.darkBorderColor, width: 8),
      ),
      child: FittedBox(
        child: SizedBox(
            // width: MediaQuery.of(context).size.width,
            child: BlocConsumer<ClickTheSoundCubit, ClickTheSoundInitial>(
                listener: (context, state) {},
                builder: (context, stateOfGame) {
                  int count = ((stateOfGame.gameData.gameLetters?.length ?? 0) / 2)
                      .round();
                  List<String> firstLetters = stateOfGame.letters?.sublist(0, count)??[];
                  List<String> secondLetters = stateOfGame.letters?.sublist(count, stateOfGame.gameData.gameLetters?.length)??[];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child:Row(
                        children: List.generate(
                          (firstLetters.length ?? 0),
                              (index) => Expanded(
                            child: _buildBubbleWidget(
                              letter: firstLetters[index] ?? '',
                              viewModel: context.read<ClickTheSoundCubit>(),
                              index: index,
                              onPress: (context
                                  .read<ClickTheSoundCubit>()
                                  .state
                                  .correctIndexes
                                  ?.contains(index) ??
                                  false)
                                  ? null
                                  : () async {
                                if (context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .ableButton()) {
                                  print(
                                      '###:${(context.read<CurrentGamePhoneticsCubit>().ableButton())}');
                                  if (firstLetters[index] ==
                                      stateOfGame.gameData.mainLetter) {
                                    await context
                                        .read<ClickTheSoundCubit>()
                                        .incrementCorrectAnswerCount(index);
                                    await context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .addSuccessAnswer(
                                        questions: stateOfGame.letters
                                            ?.where((element) =>
                                        element ==
                                            stateOfGame.gameData
                                                .mainLetter)
                                            .length ??
                                            0,
                                        correctAnswers: ((stateOfGame
                                            .correctIndexes?.length ??
                                            0)))
                                        .whenComplete(() {
                                      bool isLastQuestion = context
                                          .read<CurrentGamePhoneticsCubit>()
                                          .secondWayToCheckIfIsTheLastQuestionOfGame(
                                          queations: stateOfGame.letters
                                              ?.where((element) =>
                                          element ==
                                              stateOfGame.gameData
                                                  .mainLetter)
                                              .length ??
                                              0);
                                      if (isLastQuestion) {
                                        Future.delayed(
                                            const Duration(seconds: 2),
                                                () async {
                                              Navigator.of(context).pop();
                                            });
                                      }
                                    });
                                  } else {
                                    await context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .addWrongAnswer(
                                        actionOfWrongAnswer: () async {
                                          await context
                                              .read<ClickTheSoundCubit>()
                                              .sayTheLetter();
                                        });
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      )),
                      20.ph,
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child:Row(
                        children: List.generate(
                          (secondLetters.length ?? 0),
                              (index) => Expanded(
                            child: _buildBubbleWidget(
                              letter: secondLetters[index] ?? '',
                              viewModel: context.read<ClickTheSoundCubit>(),
                              index: index,
                              onPress: (context
                                  .read<ClickTheSoundCubit>()
                                  .state
                                  .correctIndexes
                                  ?.contains(index) ??
                                  false)
                                  ? null
                                  : () async {
                                if (context
                                    .read<CurrentGamePhoneticsCubit>()
                                    .ableButton()) {
                                  print(
                                      '###:${(context.read<CurrentGamePhoneticsCubit>().ableButton())}');
                                  if (secondLetters[index] ==
                                      stateOfGame.gameData.mainLetter) {
                                    await context
                                        .read<ClickTheSoundCubit>()
                                        .incrementCorrectAnswerCount(index);
                                    await context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .addSuccessAnswer(
                                        questions: stateOfGame.letters
                                            ?.where((element) =>
                                        element ==
                                            stateOfGame.gameData
                                                .mainLetter)
                                            .length ??
                                            0,
                                        correctAnswers: ((stateOfGame
                                            .correctIndexes?.length ??
                                            0)))
                                        .whenComplete(() {
                                      bool isLastQuestion = context
                                          .read<CurrentGamePhoneticsCubit>()
                                          .secondWayToCheckIfIsTheLastQuestionOfGame(
                                          queations: stateOfGame.letters
                                              ?.where((element) =>
                                          element ==
                                              stateOfGame.gameData
                                                  .mainLetter)
                                              .length ??
                                              0);
                                      if (isLastQuestion) {
                                        Future.delayed(
                                            const Duration(seconds: 2),
                                                () async {
                                              Navigator.of(context).pop();
                                            });
                                      }
                                    });
                                  } else {
                                    await context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .addWrongAnswer(
                                        actionOfWrongAnswer: () async {
                                          await context
                                              .read<ClickTheSoundCubit>()
                                              .sayTheLetter();
                                        });
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      )),
                    ],
                  );
                })),
      ),
    );
  }

  Widget _buildBubbleWidget({
    required String letter,
    required VoidCallback? onPress,
    required int index,
    required ClickTheSoundCubit viewModel,
  }) {
    return
      InkWell(
            onTap: onPress,
            child: Container(
              // width: 104.w,
              height: 104.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            viewModel.state.correctIndexes?.contains(index) ?? false
                ? AppImagesPhonetics.bubbleDisabled
                : AppImagesPhonetics.bubble,
          ),
          fit: BoxFit.contain)),
              child: StrokedText(
                fontSize: 25.sp,
                text: letter,
                isDisabled:
        viewModel.state.correctIndexes?.contains(index) ?? false,
              ),
            ),
      );
  }
}
