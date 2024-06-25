import 'package:based_of_eng_game/src/games/videos/cubit/video_cubit.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../src_model/export_models.dart';
import '../core/assets_sound_letters.dart';
import '../core/audio_player_letters.dart';
import '../core/games_structure/basic_of_game_data.dart';
import '../core/talk_tts.dart';
import '../cubit/current_game_phonetics_cubit.dart';
import '../games/click_the_picture/manager/click_picture_cubit.dart';
import '../games/click_the_picture/pages/click_picture_game.dart';
import '../games/click_the_picture_with_word/manager/click_the_picture_with_word_cubit.dart';
import '../games/click_the_picture_with_word/page/click_the_picture_with_word.dart';
import '../games/click_the_sound/manager/click_the_sound_cubit.dart';
import '../games/click_the_sound/pages/click_the_sound_game.dart';
import '../games/drag_out/manager/drag_out_cubit.dart';
import '../games/drag_out/pages/drag_out_game.dart';
import '../games/drag_pic_to_word/manager/drag_pic_to_word_cubit.dart';
import '../games/drag_pic_to_word/page/drag_pic_to_word.dart';
import '../games/drag_word_to_pic/manager/drag_word_to_pic_cubit.dart';
import '../games/drag_word_to_pic/page/drag_pic_to_word.dart';
import '../games/spelling_game/manager/spelling_cubit.dart';
import '../games/spelling_game/pages/spelling_game.dart';
import '../games/tracing/manager/tracing_cubit.dart';
import '../games/tracing/page/tracing_game.dart';
import '../games/videos/screen/game_video.dart';

class BasedOfGameShortVowels extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final List<GameFinalModel> gamesData;

  const BasedOfGameShortVowels(
      {super.key, required this.stateOfGame, required this.gamesData});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(stateOfGame.basicData?.background ?? ''),
                fit: BoxFit.fill)),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            /////////////////////game title//////////////////

            Positioned(
              top: -10,
              left: 0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    stateOfGame.basicData!.gameData!.isRound
                        ? Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 10.h),
                      child: GestureDetector(
                        onTap: stateOfGame.beeTalking == true
                            ? null
                            : () async {
                          await context
                              .read<CurrentGamePhoneticsCubit>()
                              .beeTalkingTrue();
                          await TalkTts.startTalk(
                              text: gamesData[stateOfGame.index]
                                  .inst ??
                                  '');
                          TalkTts.flutterTts
                              .setCompletionHandler(() async {
                            if (stateOfGame.stateOfStringIsWord ==
                                true) {
                              await TalkTts.startTalk(
                                  text: stateOfGame
                                      .stateOfStringWillSay ??
                                      '');
                            } else {
                              await AudioPlayerLetters.startPlaySound(
                                  soundPath: AssetsSoundLetters
                                      .getSoundOfLetter(
                                      mainGameLetter: stateOfGame
                                          .stateOfStringWillSay ??
                                          ''));
                            }
                          });

                          await context
                              .read<CurrentGamePhoneticsCubit>()
                              .beeTalkingFalse();
                        },
                        child: Container(
                          width: 0.48.sw,
                          height: 0.32.sh,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: -30,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: stateOfGame
                                        .avatarCurrentArtboard ==
                                        null
                                        ? Image.asset(
                                      stateOfGame.currentAvatar ?? '',
                                      // height:
                                      // MediaQuery.of(context).size.height - (70.h),
                                      height: 75.h,
                                      width: 80.w,
                                    )
                                        : Container(
                                      margin:
                                      EdgeInsets.only(left: 7.w),
                                      child: SizedBox(
                                          height: 90.h,
                                          width: 65.w,
                                          child: Rive(
                                            artboard: stateOfGame
                                                .avatarCurrentArtboard!,
                                            fit: BoxFit.fill,
                                            useArtboardSize: true,
                                            alignment:
                                            Alignment.center,
                                          )),
                                    )),
                              ),

                              PositionedDirectional(
                                top: 0,
                                start: 50.w,
                                child: Image.asset(
                                  stateOfGame.basicData?.gameData?.titleImageEn ??
                                      '',
                                  height: 75.h,
                                  width: 120.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        : Container(
                      width: 0.4.sw,
                      height: 0.32.sh,
                      padding: const EdgeInsets.only(left: 10),
                      child: Stack(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Positioned(
                            top: 0,
                            child: GestureDetector(
                              onTap: stateOfGame.beeTalking == true
                                  ? null
                                  : () async {
                                await context
                                    .read<
                                    CurrentGamePhoneticsCubit>()
                                    .beeTalkingTrue();
                                await TalkTts.startTalk(
                                    text:
                                    gamesData[stateOfGame.index]
                                        .inst ??
                                        '');
                                TalkTts.flutterTts
                                    .setCompletionHandler(() async {
                                  if (stateOfGame
                                      .stateOfStringIsWord ==
                                      true) {
                                    await TalkTts.startTalk(
                                        text: stateOfGame
                                            .stateOfStringWillSay ??
                                            '');
                                  } else {
                                    await AudioPlayerLetters.startPlaySound(
                                        soundPath: AssetsSoundLetters
                                            .getSoundOfLetter(
                                            mainGameLetter:
                                            stateOfGame
                                                .stateOfStringWillSay ??
                                                ''));
                                  }
                                });

                                await context
                                    .read<
                                    CurrentGamePhoneticsCubit>()
                                    .beeTalkingFalse();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: stateOfGame
                                      .avatarCurrentArtboard ==
                                      null
                                      ? Image.asset(
                                    stateOfGame.currentAvatar ?? '',
                                    // height:
                                    // MediaQuery.of(context).size.height - (70.h),
                                    height: 75.h,
                                    width: 80.w,
                                  )
                                      : Container(
                                    margin:
                                    EdgeInsets.only(left: 7.w),
                                    child: SizedBox(
                                        height: 90.h,
                                        width: 65.w,
                                        child: Rive(
                                          artboard: stateOfGame
                                              .avatarCurrentArtboard!,
                                          fit: BoxFit.fill,
                                          useArtboardSize: true,
                                          alignment:
                                          Alignment.center,
                                        )),
                                  )),
                            ),
                          ),
                          if (stateOfGame.basicData!.gameData!.isRound) ...{
                            PositionedDirectional(
                              top: 0,
                              child: GestureDetector(
                                onTap: stateOfGame.beeTalking == true
                                    ? null
                                    : () async {
                                  await context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .beeTalkingTrue();
                                  await TalkTts.startTalk(
                                      text: gamesData[stateOfGame.index].inst ?? '');
                                  TalkTts.flutterTts.setCompletionHandler(() async {
                                    if (stateOfGame.stateOfStringIsWord == true) {
                                      await TalkTts.startTalk(
                                          text: stateOfGame.stateOfStringWillSay ?? '');
                                    } else {
                                      await AudioPlayerLetters.startPlaySound(
                                          soundPath:
                                          AssetsSoundLetters.getSoundOfLetter(
                                              mainGameLetter: stateOfGame
                                                  .stateOfStringWillSay ??
                                                  ''));
                                    }
                                  });

                                  await context
                                      .read<CurrentGamePhoneticsCubit>()
                                      .beeTalkingFalse();
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    child: stateOfGame.avatarCurrentArtboard == null
                                        ? SizedBox(
                                      // stateOfGame.currentAvatar ?? '',
                                      // height:
                                      // MediaQuery.of(context).size.height - (70.h),
                                      height: 85.h,
                                      width: 80.w,
                                    )
                                        : SizedBox(
                                        height: 110.h,
                                        width: 70.w,
                                        child: Rive(
                                          artboard: stateOfGame.avatarCurrentArtboard!,
                                          fit: BoxFit.fill,
                                          useArtboardSize: true,
                                          alignment: Alignment.center,
                                        ))),
                              ),
                            ),
                          },

                          Positioned(
                            bottom: 0,
                            child: GestureDetector(
                              onTap: stateOfGame.beeTalking == true
                                  ? null
                                  : () async {
                                await context
                                    .read<
                                    CurrentGamePhoneticsCubit>()
                                    .beeTalkingTrue();
                                await TalkTts.startTalk(
                                    text:
                                    gamesData[stateOfGame.index]
                                        .inst ??
                                        '');
                                TalkTts.flutterTts
                                    .setCompletionHandler(() async {
                                  if (stateOfGame
                                      .stateOfStringIsWord ==
                                      true) {
                                    await TalkTts.startTalk(
                                        text: stateOfGame
                                            .stateOfStringWillSay ??
                                            '');
                                  } else {
                                    await AudioPlayerLetters.startPlaySound(
                                        soundPath: AssetsSoundLetters
                                            .getSoundOfLetter(
                                            mainGameLetter:
                                            stateOfGame
                                                .stateOfStringWillSay ??
                                                ''));
                                  }
                                });

                                await context
                                    .read<
                                    CurrentGamePhoneticsCubit>()
                                    .beeTalkingFalse();
                              },
                              child: Image.asset(
                                stateOfGame.basicData?.gameData
                                    ?.titleImageEn ??
                                    '',
                                height: 75.h,
                                width: 75.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /////////////////////game//////////////////
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if ((stateOfGame.basicData?.gameData is SpellingWordGame)) ...{
                    BlocProvider<SpellingCubit>(
                        create: (_) => SpellingCubit(
                          // gameData: stateOfGameData.data[stateOfGame.index],
                            index: stateOfGame.index,
                            background:
                            (stateOfGame.basicData?.gameData as SpellingWordGame)
                                .woodenBackground,
                            allGames: gamesData),
                        child: const SpellingGameScreen())
                  }else if ((stateOfGame.basicData?.gameData is DragPicToWordGame)) ...{
                    BlocProvider<DragPicToWordCubit>(
                        create: (_) => DragPicToWordCubit(

                            gameData: gamesData[stateOfGame.index]),
                        child:  DragPicToWordGameScreen())
                  }else if ((stateOfGame.basicData?.gameData is DragWordToPicGame)) ...{
                    BlocProvider<DragWordToPicCubit>(
                        create: (_) => DragWordToPicCubit(

                            gameData: gamesData[stateOfGame.index]),
                        child:  DragWordToPicGameScreen())
                  }
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
