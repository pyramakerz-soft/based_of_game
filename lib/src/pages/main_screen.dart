import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_models/games_models.dart';

import '../core/games_structure/basic_of_chapter.dart';
import '../widgets/based_of_game_phonetics.dart';
import '../cubit/current_game_phonetics_cubit.dart';
import '../widgets/based_of_games.dart';

class MainScreenOfGames extends StatefulWidget {
  final List<GameModel> stateOfGameData;
  final MainDataOfChapters? dataOfBasesGame;
  final bool showTheEditedGames;
  final void Function(int countOfStars) actionOfCompleteGame;

  const MainScreenOfGames(
      {super.key,
      required this.stateOfGameData,
      required this.dataOfBasesGame,
      required this.actionOfCompleteGame,
      required this.showTheEditedGames});
  @override
  State<StatefulWidget> createState() {
    return _MainScreenOfGames();
  }
}

class _MainScreenOfGames extends State<MainScreenOfGames> {
  @override
  void initState() {
    super.initState();
    // context.read<CurrentGameCubit>().getTheBackGround();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<CurrentGamePhoneticsCubit>(
            create: (_) => CurrentGamePhoneticsCubit(
                basicData: widget.dataOfBasesGame!,
                gameData: widget.stateOfGameData,
                actionOfCompleteGame: widget.actionOfCompleteGame),
            child: BlocConsumer<CurrentGamePhoneticsCubit,
                    CurrentGamePhoneticsState>(
                listener: (context, state) {},
                builder: (context, stateOfGame) {
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
                    child: BasedOfGames(
                      stateOfGame: stateOfGame,
                      gamesData: widget.showTheEditedGames
                          ? widget.stateOfGameData
                          : widget.stateOfGameData
                              .where((element) => element.isEdited == 0)
                              .toList(),
                    ),
                  );
                })));
  }
}
