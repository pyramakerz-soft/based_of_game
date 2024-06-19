import 'package:based_of_eng_game/src/widgets/empty_space.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_models/games_models.dart';
import '../core/assets_sound_letters.dart';
import '../core/audio_player_letters.dart';
import '../core/games_structure/basic_of_game_data.dart';
import '../core/talk_tts.dart';
import '../cubit/current_game_phonetics_cubit.dart';
import '../games/bingo_game/manager/bingo_cubit.dart';
import '../games/bingo_game/pages/bingo_game.dart';

class BasedOfGameConnect extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final List<GameModel> gamesData;
  const BasedOfGameConnect(
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
              top: 0,
              left: 0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    stateOfGame.basicData!.gameData!.isRound
                        ? Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  stateOfGame
                                          .basicData?.gameData?.titleImageEn ??
                                      '',
                                  height: 75.h,
                                  width: 90.w,
                                  fit: BoxFit.fill,
                                ),
                                GestureDetector(
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
                                              .read<CurrentGamePhoneticsCubit>()
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
                                              height: 85.h,
                                              width: 80.w,
                                            )
                                          : SizedBox(
                                              height: 110.h,
                                              width: 70.w,
                                              child: Rive(
                                                artboard: stateOfGame
                                                    .avatarCurrentArtboard!,
                                                fit: BoxFit.fill,
                                                useArtboardSize: true,
                                                alignment: Alignment.center,
                                              ))),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: 0.8.sw,
                            height: 0.32.sh,
                            padding: EdgeInsets.only(left: 10),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.ph,
                if ((stateOfGame.basicData?.gameData is BingoGame)) ...{
                  BlocProvider<BingoCubit>(
                      create: (_) => BingoCubit(
                            gameData: gamesData[stateOfGame.index],
                          ),
                      child: BingoGameScreen())
                } else if ((stateOfGame.basicData?.gameData is XOutGame)) ...{
                  Text('XOutGame')
                  // BlocProvider<XOutCubit>(
                  //     create: (_) => XOutCubit(
                  //           gameData: stateOfGameData.data,
                  //         ),
                  //     child: XOutGameScreen())
                } else if ((stateOfGame.basicData?.gameData
                    is SpellingGame)) ...{
                  Text('SpellingGame')
                  // BlocProvider<SpellingCubit>(
                  //     create: (_) => SpellingCubit(
                  //         // gameData: stateOfGameData.data[stateOfGame.index],
                  //         index: stateOfGame.index,
                  //         background:
                  //             (stateOfGame.basicData?.gameData as SpellingGame)
                  //                 .woodenBackground,
                  //         allGames: stateOfGameData.data),
                  //     child: SpellingGameScreen())
                } else if ((stateOfGame.basicData?.gameData
                    is SortingPicturesGame)) ...{
                  Text('SortingPicturesGame')
                  // BlocProvider<sortingCubit>(
                  //     create: (_) => sortingCubit(
                  //         gameData: stateOfGameData.data[stateOfGame.index],
                  //         index: stateOfGame.index,
                  //         background: (stateOfGame.basicData?.gameData
                  //                 as SortingPicturesGame)
                  //             .woodenBackground,
                  //         allGames: stateOfGameData.data),
                  //     child: SortingGameScreen())
                } else if ((stateOfGame.basicData?.gameData is DiceGame)) ...{
                  Text('DiceGame')
                  // BlocProvider<DiceCubit>(
                  //     create: (_) => DiceCubit(
                  //           gameData: stateOfGameData.data[stateOfGame.index],
                  //         ),
                  //     child: DiceGamePage())
                }
              ],
            ),
          ],
        ),
      ),
    );
  }
}
