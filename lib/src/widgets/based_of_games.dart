import 'package:based_of_eng_game/src/widgets/empty_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_models/games_models.dart';
import '../../based_of_game.dart';
import '../core/assets_images_phonetics.dart';
import '../core/games_structure/basic_of_game_data.dart';
import '../cubit/current_game_phonetics_cubit.dart';
import 'based_of_game_connect.dart';
import 'based_of_game_connect_sorting_cups.dart';
import 'based_of_game_phonetics.dart';

class BasedOfGames extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final List<GameModel> gamesData;

  const BasedOfGames(
      {super.key, required this.stateOfGame, required this.gamesData});
  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (x) async {
          if ((stateOfGame.basicData?.gameData is Video)) {
            context
                .read<CurrentGamePhoneticsCubit>()
                .state
                .actionWhenTriesBeZero!(stateOfGame.countOfStar ?? 0);
          }
        },
        canPop: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(stateOfGame.basicData?.background ?? ''),
                  fit: BoxFit.fill)),
          child: Column(
            // alignment: Alignment.center,
            children: [
              Container(
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
                                  if (context
                                          .read<CurrentGamePhoneticsCubit>()
                                          .state
                                          .actionWhenTriesBeZero !=
                                      null) {
                                    context
                                            .read<CurrentGamePhoneticsCubit>()
                                            .state
                                            .actionWhenTriesBeZero!(
                                        stateOfGame.countOfStar ?? 0);
                                  }
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
                            child: ((stateOfGame.countOfStar ?? 0) == 0)
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
                                            width: 40.w))
                      ],
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: (stateOfGame.basicData?.gameData is Video)
                    ? MediaQuery.of(context).size.height
                    : (MediaQuery.of(context).size.height - (50.h + 5)),
                child: Column(
                  children: [
                    if (stateOfGame.basicData?.gameData?.isConnect == true) ...{
                      if (stateOfGame.basicData is ConnectionSortingCups) ...{
                        BasedOfGameConnectSortingCups(
                          stateOfGame: stateOfGame,
                          gamesData: gamesData,
                        ),
                      } else ...{
                        BasedOfGameConnect(
                          stateOfGame: stateOfGame,
                          gamesData: gamesData,
                        ),
                      }
                    } else if (BaseOfGames.isPhonetics(
                        chapter: stateOfGame.basicData.runtimeType)) ...{
                      BasedOfGamePhonetics(
                        stateOfGame: stateOfGame,
                        gamesData: gamesData,
                      ),
                    } else ...{
                      const SizedBox()
                    }
                  ],
                ),
              ),

              // Text(stateOfGame.basicData.runtimeType.toString()),
              // Text(stateOfGame.basicData?.gameData.runtimeType.toString() ?? ''),
            ],
          ),
        ));
  }
}
