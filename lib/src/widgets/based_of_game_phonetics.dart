import 'package:based_of_eng_game/src/widgets/empty_space.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_models/games_models.dart';
import '../../based_of_game.dart';
import '../core/audio_player_letters.dart';
import '../core/games_structure/basic_of_game.dart';
import '../core/talk_tts.dart';
import '../cubit/current_game_phonetics_cubit.dart';
import '../games/click_the_sound/manager/click_the_sound_cubit.dart';
import '../games/click_the_sound/pages/click_the_sound_game.dart';
import '../games/drag_out/manager/drag_out_cubit.dart';
import '../games/drag_out/pages/drag_out_game.dart';

class BasedOfGamePhonetics extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final List<GameModel> gamesData;

  const BasedOfGamePhonetics(
      {super.key, required this.stateOfGame, required this.gamesData});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            left: (stateOfGame.basicData?.gameData is Tracking) ? null : 0,
            bottom: 0,
            child: SizedBox(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if ((stateOfGame.basicData?.gameData is BasicDragOutGame)) ...{
                  ///todo need to know why when the index of CurrentGamePhoneticsCubit change
                  BlocProvider<DragOutCubit>(
                      create: (_) => DragOutCubit(
                          index: stateOfGame.index,
                          gameData: gamesData[stateOfGame.index],
                          allGameData: gamesData),
                      child: DragOutGame(
                          // index: foo,
                          // gameData: gamesData[foo],
                          // allGameData: gamesData,
                          ))
                } else if ((stateOfGame.basicData?.gameData
                    is ClickPicture)) ...{
                  const Text('in click picture')
                } else if ((stateOfGame.basicData?.gameData
                    is ClickPictureOfWord)) ...{
                  const Text('in click picture by word')
                } else if ((stateOfGame.basicData?.gameData
                    is BasicClickTheSoundGame)) ...{
                  BlocProvider<ClickTheSoundCubit>(
                      create: (_) => ClickTheSoundCubit(
                            gameData: gamesData[stateOfGame.index],
                          ),
                      child: const ClickTheSoundGame()),
                } else if (stateOfGame.basicData?.gameData is Tracking) ...{
                  const Text('tracking'),
                }
              ],
            ))),
        Positioned(
            top: 0,
            left: 20,
            child: Image.asset(
              stateOfGame.basicData?.gameData?.titleImageEn ?? '',
              height: 75.h,
            )),
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
                  GestureDetector(
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
                                    text:
                                        stateOfGame.stateOfStringWillSay ?? '');
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
                                ))),
                  ),
                  // SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
