import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_models/games_models.dart';

import '../based_of_games/based_of_game_phonetics.dart';
import '../core/basic_of_phonetics.dart';
import '../cubit/current_game_phonetics_cubit.dart';

class MainScreenOfGames extends StatefulWidget {
  final List<GameModel> stateOfGameData;
  final MainDataOfPhonetics? dataOfBasesGame;
  final void Function(int countOfStars) actionOfCompleteGame;

  const MainScreenOfGames(
      {super.key,
      required this.stateOfGameData,
      required this.dataOfBasesGame,
      required this.actionOfCompleteGame});
  @override
  State<StatefulWidget> createState() {
    return _MainScreenOfGames();
  }
}

class _MainScreenOfGames extends State<MainScreenOfGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<CurrentGamePhoneticsCubit>(
            create: (_) => CurrentGamePhoneticsCubit(
                  basicData: widget.dataOfBasesGame!,
                  gameData: widget.stateOfGameData,
                ),
            child: BlocConsumer<CurrentGamePhoneticsCubit,
                CurrentGamePhoneticsState>(listener: (context, state) {
              print('widget.dataOfBasesGame:${widget.dataOfBasesGame}');
              // if (widget.dataOfBasesGame != null) {
              //   context
              //       .read<CurrentGamePhoneticsCubit>()
              //       .updateDataOfCurrentGame(
              //
              //           gameIndex: 0);
              // }
            }, builder: (context, stateOfGame) {
              return Listener(
                  onPointerDown: (opm) {
                    context
                        .read<CurrentGamePhoneticsCubit>()
                        .savePointerPosition(opm.pointer, opm.position);
                  },
                  onPointerMove: (opm) {
                    context
                        .read<CurrentGamePhoneticsCubit>()
                        .savePointerPosition(opm.pointer, opm.position);
                  },
                  onPointerCancel: (opm) {
                    context
                        .read<CurrentGamePhoneticsCubit>()
                        .clearPointerPosition(opm.pointer);
                  },
                  onPointerUp: (opm) {
                    context
                        .read<CurrentGamePhoneticsCubit>()
                        .clearPointerPosition(opm.pointer);
                  },
                  child: Center(
                    child: Column(
                      // alignment: Alignment.center,
                      children: [
                        // if (stateOfGame.countOfTries != 0) ...{
                        //   if (stateOfGame.basicData?.gameData?.isConnect ==
                        //       true) ...{
                        //     if (stateOfGame.basicData
                        //         is ConnectionSortingCups) ...{
                        //       BasedOfGameConnectSortingCups(
                        //         stateOfGame: stateOfGame,
                        //         gamesData: widget.stateOfGameData,
                        //       ),
                        //     } else ...{
                        //       BasedOfGameConnect(
                        //         stateOfGame: stateOfGame,
                        //         gamesData: widget.stateOfGameData,
                        //       ),
                        //     }
                        //   } else ...{
                        BasedOfGamePhonetics(
                          stateOfGame: stateOfGame,
                          gamesData: widget.stateOfGameData,
                        ),
                        //   },
                        // }
                      ],
                    ),
                  ));
            })));
  }
}
