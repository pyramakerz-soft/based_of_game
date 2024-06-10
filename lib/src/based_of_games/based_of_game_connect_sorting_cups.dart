import 'package:based_of_eng_game/src/widgets/empty_space.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_models/games_models.dart';
import '../../based_of_game.dart';
import '../core/audio_player_letters.dart';
import '../core/basic_of_every_game.dart';
import '../core/talk_tts.dart';
import '../cubit/current_game_phonetics_cubit.dart';

class BasedOfGameConnectSortingCups extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final List<GameModel> gamesData;

  const BasedOfGameConnectSortingCups(
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
        alignment: Alignment.topRight,
        children: [
          /////////////////////game title//////////////////
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.ph,
              if ((stateOfGame.basicData?.gameData is SortingCupsGame)) ...{
                const Text('in sorting cups game')
              }
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.h,
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
                              width: 50.w,
                            ),
                            ((stateOfGame.countOfStar ?? 0) == 0)
                                ? Image.asset(AppImagesPhonetics.barZeroStar,
                                    width: 40.w)
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
                        )),
                      ],
                    ),
                  ),
                  Container(
                      width: 120.w,
                      padding: EdgeInsets.only(left: 10.w),
                      child: GestureDetector(
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
                                        stateOfGame.stateOfStringWillSay ??
                                            ''));
                          }
                        },
                        child: Image.asset(
                          stateOfGame.basicData?.gameData?.titleImage ?? '',
                          height: 50.h,
                          width: 120.w,
                          fit: BoxFit.fill,
                        ),
                      )),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 20,
            child: GestureDetector(
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
                  alignment: Alignment.center,
                  child: stateOfGame.avatarCurrentArtboard == null
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
                            artboard: stateOfGame.avatarCurrentArtboard!,
                            fit: BoxFit.fill,
                            useArtboardSize: true,
                            alignment: Alignment.center,
                          ))),
            ),
          ),
        ],
      ),
    );
  }
}
