import 'package:based_of_eng_game/src/widgets/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../src_model/export_models.dart';
import '../../../core/assets_images_phonetics.dart';
import '../../../core/games_structure/basic_of_game_data.dart';
import '../../../core/phonetics_color.dart';
import '../../../core/theme_text.dart';
import '../../../cubit/current_game_phonetics_cubit.dart';
import '../manager/click_picture_cubit.dart';
import '../widgets/single_row.dart';

class ClickPictureGame extends StatefulWidget {
  const ClickPictureGame({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ClickPictureGame();
  }
}

class _ClickPictureGame extends State<ClickPictureGame> {
  @override
  void initState() {
    final GameFinalModel gameData =
        context.read<ClickPictureCubit>().state.gameData;
    context.read<CurrentGamePhoneticsCubit>().getStateOfStars(
        mainCountOfQuestion: gameData.gameImages
                ?.where((element) => element.correct == 1)
                .toList()
                .length ??
            0);

    context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
        stateOfStringIsWord: false,
        stateOfStringWillSay: gameData.mainLetter ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isInteracting =
        context.watch<CurrentGamePhoneticsCubit>().state.stateOfAvatar;

    return BlocConsumer<ClickPictureCubit, ClickPictureInitial>(
        listener: (context, state) {
      // int success = state.correctIndexes.length;
      // if (success ==
      //     (gameData.gameImages?.where((e) => e.correct == 1).toList().length ??
      //         1)) {
      //   Future.delayed(Duration(seconds: 2), () {
      //     // context.read<CurrentGamePhoneticsCubit>().sendStars(
      //     //     gamesId: [state.gameData.id ?? 0],
      //     //     actionOfStars: (int countOfStars, List<int> listOfIds) {
      //     //       context
      //     //           .read<JourneyBarCubit>()
      //     //           .sendStars(gamesId: listOfIds, countOfStar: countOfStars);
      //     //     });
      //
      //     Navigator.pop(context);
      //   });
      // }
      // if (success == 2 || success == 4 || success ==5) {
      //   context.read<CurrentGamePhoneticsCubit>().increaseDirectlyCountOfStar();
      // }
    }, builder: (context, stateOfGameData) {
      // context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
      //     stateOfStringIsWord: false,
      //     stateOfStringWillSay: stateOfGameData.gameData.mainLetter ?? '');
      return Container(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(
              bottom: (30),
              top: 10,
              left: stateOfGameData.isArabic == true ? 0 : 20,
              right: stateOfGameData.isArabic == true ? 20 : 0),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: MediaQuery.of(context).size.width - (130 + 50),
          // height: MediaQuery.of(context).size.height - (50.h + 55),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: AppColorPhonetics.boarderColor, width: 5)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Wrap(
                spacing: 15,
                alignment: WrapAlignment.center,
                children: List.generate(
                    stateOfGameData.gameData.gameImages?.length ?? 0,
                    (index) => FittedBox(
                          child: SingleElement(
                            index: index,
                            background: stateOfGameData.backGround[index],
                            image: stateOfGameData
                                    .gameData.gameImages?[index].image ??
                                '',
                            selected: context
                                .read<ClickPictureCubit>()
                                .state
                                .correctIndexes
                                .contains(index),
                            height: (MediaQuery.of(context).size.height -
                                    (50.h + 75 + 20)) /
                                2,
                            onTap: isInteracting != null &&
                                    isInteracting != BasicOfGameData.stateOIdle
                                ? null
                                : () async {
                                    // if (clickPictureCubit.checkCurrentClickTime(
                                    //     current: DateTime.now())) {
                                    if (!stateOfGameData.correctIndexes
                                        .contains(index)) {
                                      if (stateOfGameData.gameData
                                              .gameImages?[index].correct ==
                                          1) {
                                        context
                                            .read<ClickPictureCubit>()
                                            .addAnswer(index);
                                        await context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .addSuccessAnswer(
                                                questions: stateOfGameData
                                                        .gameImages
                                                        ?.where((element) =>
                                                            element.correct ==
                                                            1)
                                                        .length ??
                                                    0,
                                                correctAnswers: stateOfGameData
                                                    .correctIndexes.length)
                                            .whenComplete(() {
                                          bool isLastQuestion = context
                                              .read<CurrentGamePhoneticsCubit>()
                                              .checkIfIsTheLastQuestionOfGame(
                                                  queations: stateOfGameData
                                                          .gameImages
                                                          ?.where((element) =>
                                                              element.correct ==
                                                              1)
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
                                              .read<ClickPictureCubit>()
                                              .sayTheLetter();
                                        });
                                      }
                                    }
                                    // }
                                  },
                          ),
                        )),
              ),
              Positioned(
                  top: -60,
                  right: -60,
                  child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  AppImagesPhonetics.letterOfClickPic))),
                      child: Text(
                        stateOfGameData.gameData.mainLetter ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontSize: 70,
                                fontWeight: FontWeight.w700,
                                color: AppColorPhonetics.darkBorderColor,
                                fontFamily: AppTheme.getFontFamily5()),
                      )))
            ],
          ),
        ),
      );
    });
  }
}
