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
  return Dialog(
    backgroundColor: Colors.transparent,
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
              top: 80,
              // end: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Image.asset(
                          AppImagesPhonetics.iconEmptyStar2,
                          height: 40,
                        )),
              )),
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
            top: 130,
            right: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"Try again?"',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: AppColorPhonetics.darkBlueColor,
                    fontFamily: AppTheme.getFontFamily5(),
                  ),
                ),
                ReTryButtton(
                    dataFunction: () => actionOfDone(),
                    title: 'Retry',
                    width: 150)
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
