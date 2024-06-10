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
import '../core/basic_of_every_game.dart';
import '../core/talk_tts.dart';
import '../cubit/current_game_phonetics_cubit.dart';
import '../games/click_the_sound/manager/click_the_sound_cubit.dart';
import '../games/click_the_sound/pages/click_the_sound_game.dart';

class BasedOfGamePhonetics extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final List<GameModel> gamesData;

  const BasedOfGamePhonetics(
      {super.key, required this.stateOfGame, required this.gamesData});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(stateOfGame.basicData?.background ?? ''),
              fit: BoxFit.fill)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ///////////////////game//////////////////

          // Text('${(stateOfGame.basicData?.gameData)}'),
          Positioned(
              left: (stateOfGame.basicData?.gameData is Tracking) ? null : 0,
              bottom: 0,
              child: SizedBox(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if ((stateOfGame.basicData?.gameData
                      is BasicDragOutGame)) ...{
                    const Text('in dragout game')
                  } else if ((stateOfGame.basicData?.gameData
                      is ClickPictureS)) ...{
                    const Text('in click picture')
                  } else if ((stateOfGame.basicData?.gameData
                      is ClickPictureOfWord)) ...{
                    const Text('in click picture by word')
                  } else if ((stateOfGame.basicData?.gameData
                      is BasicClickTheSoundGame)) ...{
                    // const Text('in click the sound')
                    BlocProvider<ClickTheSoundCubit>(
                        create: (_) => ClickTheSoundCubit(
                              gameData: gamesData[stateOfGame.index],
                            ),
                        child: ClickTheSoundGame()),
                  } else if (stateOfGame.basicData?.gameData is Tracking) ...{
                    const Text('tracking'),
                  }
                ],
              ))),

          ///////////////////game title//////////////////
          Positioned(
            top: 0,
            child: Container(
              height: 50.h + 5,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: stateOfGame.basicData?.backGroundOfStarBar,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 24,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            30.pw,
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Image.asset(
                                AppImagesPhonetics.backButtonIcon,
                                height: 40.h,
                                // width: 40.w,
                              ),
                            ),
                            10.pw,
                            GestureDetector(
                              child: Image.asset(
                                AppImagesPhonetics.settingButtonIcon,
                                height: 45.h,
                                // width: 40.w,
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppImagesPhonetics.stayOfStarBar,
                        width: 65.w,
                        fit: BoxFit.contain,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ((stateOfGame.countOfStar ?? 0) == 0)
                                ? Image.asset(
                                    AppImagesPhonetics.barZeroStar,
                                    width: 40.w,
                                    fit: BoxFit.contain,
                                  )
                                : ((stateOfGame.countOfStar ?? 0) == 1)
                                    ? Image.asset(AppImagesPhonetics.barOneStar,
                                        width: 40.w)
                                    : ((stateOfGame.countOfStar ?? 0) == 2)
                                        ? Image.asset(
                                            AppImagesPhonetics.barTwoStar,
                                            width: 40.w)
                                        : Image.asset(
                                            AppImagesPhonetics.barThreeStar,
                                            width: 40.w)
                          ],
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
          Positioned(
              top: 50.h + 5,
              left: 20,
              child: Image.asset(
                stateOfGame.basicData?.gameData?.titleImage ?? '',
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
                      onTap: () async {
                        await TalkTts.startTalk(
                            text: gamesData[stateOfGame.index].inst ?? '');
                        if (stateOfGame.stateOfStringIsWord == true) {
                          await TalkTts.startTalk(
                              text: stateOfGame.stateOfStringWillSay ?? '');
                        } else {
                          await AudioPlayerLetters.startPlaySound(
                              soundPath: AssetsSoundLetters.getSoundOfLetter(
                                  mainGameLetter:
                                      stateOfGame.stateOfStringWillSay ?? ''));
                        }
                      },
                      child: Container(
                          child: stateOfGame.avatarCurrentArtboard == null
                              ? Image.asset(
                                  stateOfGame.currentAvatar ?? '',
                                  height:
                                      MediaQuery.of(context).size.height > 450
                                          ? 250.h
                                          : 200.h,
                                  width: 100.w,
                                )
                              : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height > 450
                                          ? 250.h
                                          : 180.h,
                                  width: 80.w,
                                  child: Rive(
                                    artboard:
                                        stateOfGame.avatarCurrentArtboard!,
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
      ),
    );
  }
}
