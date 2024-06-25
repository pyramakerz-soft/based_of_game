import 'package:based_of_eng_game/src/widgets/empty_space.dart';
import 'package:based_of_eng_game/src/widgets/widget_of_tries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../src_model/export_models.dart';
import '../../based_of_eng_game.dart';
import '../core/assets_images_main.dart';
import '../core/assets_images_phonetics.dart';
import '../core/games_structure/basic_of_game_data.dart';
import '../cubit/current_game_phonetics_cubit.dart';
import 'based_of_all_game.dart';
import 'based_of_game_connect.dart';
import 'based_of_game_connect_sorting_cups.dart';
import 'based_of_game_phonetics.dart';
import 'based_of_video_game.dart';
import 'game_bar.dart';

class BasedOfGames extends StatelessWidget {
  final CurrentGamePhoneticsState stateOfGame;
  final List<GameFinalModel> gamesData;

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
                .actionWhenTriesBeZero(stateOfGame.countOfStar ?? 0);
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
              if (stateOfGame.basicData?.gameData is Video) ...{
                BasedOfVideoGame(
                  stateOfGame: stateOfGame,
                  gamesData: gamesData,
                )
              } else ...{
                BasedOfAllGame(
                  stateOfGame: stateOfGame,
                  gamesData: gamesData,
                )
              }
            ],
          ),
        ));
  }
}
