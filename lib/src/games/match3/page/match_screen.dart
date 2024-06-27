// import 'package:based_of_eng_game/src/widgets/empty_space.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../based_of_eng_game.dart';
// import '../../../../src_model/export_models.dart';
// import '../../../core/phonetics_color.dart';
// import '../../../core/theme_text.dart';
// import '../../../cubit/current_game_phonetics_cubit.dart';
// import '../manager/match_cubit.dart';
// import '../matching_path.dart';
//
// class MatchScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MatchScreen();
//   }
// }
//
// class _MatchScreen extends State<MatchScreen> {
//   @override
//   void initState() {
//     final List<GameFinalModel> gameData =
//         context.read<MatchCubit>().state.listGameData;
//     context
//         .read<CurrentGamePhoneticsCubit>()
//         .getStateOfStars(mainCountOfQuestion: gameData.length);
//     context.read<CurrentGamePhoneticsCubit>().saveTheStringWillSay(
//         stateOfStringIsWord: false,
//         stateOfStringWillSay: gameData.first.mainLetter ?? '');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final stateOfCurrentGamePhoneticsCubit =
//         context.watch<CurrentGamePhoneticsCubit>().state;
//     return BlocConsumer<MatchCubit, MatchInitial>(
//         listener: (context, state) {},
//         builder: (context, gameState) {
//           return Container(
//             margin: const EdgeInsets.only(bottom: (15 + 50), top: 50),
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             width: MediaQuery.of(context).size.width - (130 + 50 + 130),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                     color: AppColorPhonetics.boarderColor, width: 5)),
//             child: Column(
//               children:
//                   List.generate(gameState.finalDataWillShow.length, (index) {
//                 return CustomPaint(
//                     painter: MatchingPainter(gameState.positions[index].first,
//                         gameState.positions[index].last),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                             onTapUp: (TapUpDetails details) {
//                               context.read<MatchCubit>().addCorrectAnswer(
//                                   index: index,
//                                   position: details.localPosition,
//                                   isFirst: true);
//                             },
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 SizedBox(
//                                   width: MediaQuery.of(context).size.width / 6,
//                                   child: Text(
//                                     gameState.finalDataWillShow[index].word ??
//                                         '',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontFamily: AppTheme.getFontFamily5(),
//                                         color:
//                                             AppColorPhonetics.darkBorderColor),
//                                     textAlign: TextAlign.start,
//                                   ),
//                                 ),
//                                 20.pw,
//                                 Container(
//                                   height: 17,
//                                   width: 17,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(17),
//                                       color:
//                                           AppColorPhonetics.lightYellowColor),
//                                 )
//                               ],
//                             )),
//                         GestureDetector(
//                             onTapUp: (TapUpDetails details) {
//                               context.read<MatchCubit>().addCorrectAnswer(
//                                   index: index,
//                                   position: Offset(
//                                       (MediaQuery.of(context).size.width -
//                                               (420)) -
//                                           details.localPosition.dx,
//                                       details.localPosition.dy),
//                                   isFirst: false);
//                             },
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   height: 17,
//                                   width: 17,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(17),
//                                       color:
//                                           AppColorPhonetics.lightYellowColor),
//                                 ),
//                                 20.pw,
//                                 CachedNetworkImage(
//                                   imageUrl: gameState
//                                           .finalDataWillShow[index].image ??
//                                       '',
//                                   height:
//                                       (MediaQuery.of(context).size.height) / 5,
//                                   width: MediaQuery.of(context).size.width / 15,
//
//                                   // height: 0.33.sh,
//                                   placeholder: (context, url) => const Center(
//                                     child: CupertinoActivityIndicator(),
//                                   ),
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(
//                                     Icons.error,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             )),
//                       ],
//                     ));
//               }),
//             ),
//           );
//         });
//   }
// }
