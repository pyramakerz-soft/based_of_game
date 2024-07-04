import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../core/assets_images_phonetics.dart';
import '../core/assets_svg_images.dart';
import '../core/phonetics_color.dart';
import '../core/theme_text.dart';
import '../cubit/current_game_phonetics_cubit.dart';
import 'button_start_game.dart';

widgetOfTries(
    {required BuildContext context,
    required CurrentGamePhoneticsState stateOfGame,
    required Function() actionOfDone,
    required Function() backButton}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        bottom: 15,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: SizedBox(
            // width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Container(
                    child: stateOfGame.avatarCurrentArtboard == null
                        ? Image.asset(
                            stateOfGame.currentAvatar ?? '',
                            height: MediaQuery.of(context).size.height > 450
                                ? 250.h
                                : 200.h,
                            width: 100.w,
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height > 450
                                ? 250.h
                                : 180.h,
                            width: 80.w,
                            child: Rive(
                              artboard: stateOfGame.avatarCurrentArtboard!,
                              fit: BoxFit.fill,
                              // useArtboardSize: true,
                            )))
                // SizedBox(),
              ],
            ),
          ),
        ),
      ),
      Center(
        child: SizedBox(
          height: 335,
          width: 286,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PositionedDirectional(
                top: 20,
                end: 0,
                child: SvgPicture.asset(
                  AppSvgImages.beeAlert,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned.fill(
                child: SvgPicture.asset(
                  AppSvgImages.popUpBackground,
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
              PositionedDirectional(
                top: 90,
                start: 0,
                child: GestureDetector(
                  onTap: () => backButton(),
                  child: SvgPicture.asset(
                    AppSvgImages.exitButton,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 80,
                child: SizedBox(
                  height: 150,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (index) =>Image.asset(
                                        AppImagesPhonetics.iconEmptyStar,
                                        height: 30,
                                      )),
                      ),
                      Text(
                        '"Try again?"',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppColorPhonetics.darkBlueColor,
                          fontFamily: AppTheme.getFontFamily5(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ReTryButtton(
                          dataFunction: () {
                            final basicData = context
                                .read<CurrentGamePhoneticsCubit>()
                                .state
                                .basicData;
                            final gameData = context
                                .read<CurrentGamePhoneticsCubit>()
                                .state
                                .gameData;
                            gameData?.first.gameLetters?.forEach((element) {
                              debugPrint('%%:${element.id}');
                            });
                            context
                                .read<CurrentGamePhoneticsCubit>()
                                .updateDataOfCurrentGame(
                                    basicData: basicData!,
                                    gameData: (gameData ?? []),
                                    gameIndex: 0);
                          },
                          title: 'Retry',
                          width: 150)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
